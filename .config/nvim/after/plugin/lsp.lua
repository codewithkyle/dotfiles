local lsp_zero = require('lsp-zero')

-- Setup Mason
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'ts_ls', 'rust_analyzer' },
    handlers = {
        lsp_zero.default_setup,
    },
})

-- nvim-cmp setup
local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer' },
    },
})

-- LSP attach
lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

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
