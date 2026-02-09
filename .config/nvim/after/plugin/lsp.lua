-- Mason: installs servers, but does not configure/enable them.
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer" },
})

-- nvim-cmp (unchanged idea, but capabilities are now wired manually)
local cmp = require("cmp")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = cmp_nvim_lsp.default_capabilities()

local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
  sources = {
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "cmdline" },
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    -- disable Tab / Shift-Tab
    ["<Tab>"] = cmp.mapping(function() end),
    ["<S-Tab>"] = cmp.mapping(function() end),
  },
})

-- Configure servers using Neovim 0.11+ API
-- (nvim-lspconfig provides the per-server defaults via its lsp/ configs)
vim.lsp.config("ts_ls", {
  capabilities = capabilities,
})

vim.lsp.config("rust_analyzer", {
  capabilities = capabilities,
})

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})

-- Enable servers (starts automatically for matching filetypes)
vim.lsp.enable({ "lua_ls", "ts_ls", "rust_analyzer" })

-- Keymaps + per-client logic on attach
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    -- Disable eslint client (your existing behavior)
    if client.name == "eslint" then
      vim.lsp.stop_client(client.id)
      return
    end

    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition({ loclist = true, reuse_win = true })
    end, opts)

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)
  end,
})

vim.diagnostic.config({ virtual_text = true })

-- auto close definition list after picking an entry
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    local close_cmd =
      vim.fn.getwininfo(vim.api.nvim_get_current_win())[1].loclist == 1
      and "lclose" or "cclose"

    vim.keymap.set("n", "<CR>", "<CR>:" .. close_cmd .. "<CR>", { buffer = true, silent = true })
  end,
})

vim.lsp.set_log_level("off")
