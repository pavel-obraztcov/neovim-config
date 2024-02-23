-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
	  'morhetz/gruvbox',
	  as = "gruvbox",
	  config = function()
		  vim.cmd('colorscheme gruvbox')
	  end
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use({
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
      requires = "nvim-treesitter/nvim-treesitter",
  })

  use('nvim-treesitter/playground', {run = ':TSUpdate'})

  use('ThePrimeagen/harpoon')

  use('mbbill/undotree')

  use('tpope/vim-fugitive')

  use { 'tpope/vim-surround' }

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
			--LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	}

    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-cmdline')

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use { 'milanglacier/yarepl.nvim' }

    use { 'ThePrimeagen/vim-be-good' }
 end)
