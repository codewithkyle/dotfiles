local ok, ts = pcall(require, "nvim-treesitter")
if not ok then
  return
end

ts.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

ts.install({
  "c",
  "lua",
  "rust",
  "javascript",
  "typescript",
  "php",
  "c_sharp",
  "go",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "c",
    "lua",
    "rust",
    "javascript",
    "typescript",
    "php",
    "cs",
    "go",
  },
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    vim.bo.syntax = "php"
  end,
})

vim.filetype.add({
  filename = {
    [".gitignore"] = "conf",
    [".django"] = "htmldjango",
  },
})
