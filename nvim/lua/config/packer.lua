return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  --use{
      --'folke/tokyonight.nvim',
      --config = function()
          --vim.cmd[[colorscheme tokyonight-night]]
      --end
  --}
  --use {
      --"catppuccin/nvim",
      --as = "catppuccin",
      --config = function()
          --vim.cmd[[colorscheme catppuccin-macchiato]]
      --end
  --}
  use { "ellisonleao/gruvbox.nvim" }
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
          {'nvim-tree/nvim-web-devicons'},
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
  use("editorconfig/editorconfig-vim")
  use("preservim/nerdcommenter")
  use {
      "akinsho/toggleterm.nvim",
      tag = '*',
      config = function()
          require("toggleterm").setup()
      end
  }
  use("github/copilot.vim")
  use {
      "rust-lang/rust.vim",
      ft = "rust",
      config = function()
          vim.g.rustfmt_autosave = 1
      end
  }
end)
