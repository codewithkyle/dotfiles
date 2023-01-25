return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use{
      'folke/tokyonight.nvim',
      config = function()
          vim.cmd[[colorscheme tokyonight-night]]
      end
  }
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  use('ThePrimeagen/harpoon')
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
          -- Snippets
          {'L3MON4D3/LuaSnip'},
          {'saadparwaiz1/cmp_luasnip'},
          {'rafamadriz/friendly-snippets'},
          -- Mason
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},
          -- Icons
          {"onsails/lspkind.nvim"},
      }
  }
  use("nvim-lualine/lualine.nvim")
  use("folke/trouble.nvim")
  use {
      'rmagatti/goto-preview',
      config = function()
          require('goto-preview').setup {}
      end
  }
end)
