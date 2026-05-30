require("fex").setup({
  ls = "-ahl --group-directories-first --time-style=long-iso",
})

vim.keymap.set("n", "<leader>e", "<cmd>Fex<CR>", {
  desc = "Open Fex",
})
