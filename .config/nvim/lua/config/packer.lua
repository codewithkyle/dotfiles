return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -- Common dependency
  use("nvim-lua/plenary.nvim")

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.x",
    requires = { "nvim-lua/plenary.nvim" },
  })

  -- Theme
  use("ellisonleao/gruvbox.nvim")

  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

  -- Harpoon 2
  use({
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { "nvim-lua/plenary.nvim" },
  })

  -- Utilities
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("tpope/vim-sleuth")
  use("preservim/nerdcommenter")

  -- Statusline
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
  })

  -- Trouble
  use({
    "folke/trouble.nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
  })

  -- Devicons (only once)
  use({
    "nvim-tree/nvim-web-devicons",
    opt = true,
    cond = vim.g.have_nerd_font,
  })

  -- LSP / Mason (no lsp-zero)
  use({
    "neovim/nvim-lspconfig",
    requires = {
      { "mason-org/mason.nvim", version = "^1.0.0" },
      { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
    },
  })

  -- Completion
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      -- Snippets (keep only if you actually use snippets)
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
  })

  -- UI / QoL
  use("j-hui/fidget.nvim")
  use({
    "folke/todo-comments.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  -- Misc
  use("ThePrimeagen/99")
end)
