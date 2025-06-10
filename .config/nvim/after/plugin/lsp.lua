local lsp = require("lsp-zero")

lsp.preset("recommended")

local cmp = require('cmp')

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})
-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'nvim_buffer'},
    {name = 'nvim_path'},
    {name = 'nvim_cmdline'},
  },
  mapping = cmp_mappings,
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = '🔥',
        warn = '⛔',
        hint = '💡',
        info = '📚'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.name == "eslint" then
        vim.cmd.LspStop('eslint')
        return
    end

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition({ loclist = true, reuse_win = true }) end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver', 'rust_analyzer' },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

-- auto close definition list after picking an entry
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',      -- qf is the filetype for both quickfix & location lists
  callback = function()
    -- Figure out whether this window is a quickfix or location list
    local close_cmd =
      vim.fn.getwininfo(vim.api.nvim_get_current_win())[1].loclist == 1
        and 'lclose'    -- location list
        or  'cclose'    -- quickfix

    -- Remap <CR> inside the list window: jump, then close the window
    vim.keymap.set('n', '<CR>', '<CR>:' .. close_cmd .. '<CR>',
                   {buffer = true, silent = true})
  end,
})
