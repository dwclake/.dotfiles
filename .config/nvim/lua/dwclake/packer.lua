-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ('github/copilot.vim')
  use ('reasonml-editor/vim-reason-plus')
  use ('gleam-lang/gleam.vim')

  use ({
    "rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine-moon")
	end
  })
  use ('AlexvZyl/nordic.nvim')

  use {'nvim-treesitter/nvim-treesitter', run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use {
      'theprimeagen/harpoon',
      branch = "harpoon2",
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use ('mbbill/undotree')
  use {"akinsho/toggleterm.nvim", tag = "*", config = function() 
      require("toggleterm").setup({
        float_opts = {
            border = "curved",
            width = 80,
            height = 30,
            }

      })
  end}
  use ('kdheepak/lazygit.nvim')
  
  use({
      "kylechui/nvim-surround",
      tag = "*",
      config = function() require("nvim-surround").setup({

      })
    end
  })

  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {'williamboman/mason.nvim'},           -- Optional
          {'williamboman/mason-lspconfig.nvim'}, -- Optional

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},         -- Required
          {'hrsh7th/cmp-nvim-lsp'},     -- Required
          {'hrsh7th/cmp-buffer'},       -- Optional
          {'hrsh7th/cmp-path'},         -- Optional
          {'saadparwaiz1/cmp_luasnip'}, -- Optional
          {'hrsh7th/cmp-nvim-lua'},     -- Optional

          -- Snippets
          {'L3MON4D3/LuaSnip'},             -- Required
          {'rafamadriz/friendly-snippets'}, -- Optional
      }
  }

use ('nvim-tree/nvim-web-devicons')

use {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup()
    end
}

use ('nvim-lualine/lualine.nvim')
use ('windwp/nvim-autopairs')

end)
