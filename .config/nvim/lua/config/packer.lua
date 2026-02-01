return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')
  use("nvim-lua/plenary.nvim")
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use("ellisonleao/gruvbox.nvim")
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'hrsh7th/cmp-cmdline'},
          {'hrsh7th/cmp-nvim-lua'},
          {'hrsh7th/nvim-cmp'},
          -- Mason
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},
          -- Icons
          {"onsails/lspkind.nvim"},
          {'nvim-tree/nvim-web-devicons'},
      }
  }
  use("nvim-lualine/lualine.nvim")
  use("folke/trouble.nvim")
  use("preservim/nerdcommenter")
  --use("zbirenbaum/copilot.lua")
  use("tpope/vim-sleuth")
  use {
      'nvim-tree/nvim-web-devicons',
      enabled = vim.g.have_nerd_font
  }
  use("j-hui/fidget.nvim")
  use {
      "folke/todo-comments.nvim",
      requires = { {"nvim-lua/plenary.nvim"} }
  }
  use("ThePrimeagen/99")
end)
