-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ('github/copilot.vim')

  use ({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use ('nvim-treesitter/playground')
  use ('theprimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  use {"akinsho/toggleterm.nvim", tag = "*", config = function() 
      require("toggleterm").setup({
        float_opts = {
            border = "curved",
            width = 80,
            height = 30,
            }

      })
  end}
  use ('reasonml-editor/vim-reason-plus')
  use ('kdheepak/lazygit.nvim')
  use ('alaviss/nim.nvim')
  use ('jlcrochet/vim-crystal')
  
  --use {'neoclide/coc.nvim', branch = 'release'}

  use({
      "kylechui/nvim-surround",
      tag = "*",
      config = function() require("nvim-surround").setup({

      })
    end
  })

  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
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
