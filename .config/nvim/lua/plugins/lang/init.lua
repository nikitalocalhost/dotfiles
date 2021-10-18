local P = {}

function P.init(use)
	use {
		'neovim/nvim-lspconfig',
		config = function()
			require('plugins.lang.lsp')
		end,
		requires = {
			{ 'kabouzeid/nvim-lspinstall' }
		}
	}

	use {
		'hrsh7th/nvim-cmp',
		config = function()
			require('plugins.lang.compe')
		end,
		requires = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/nvim-cmp' },
			{ 'L3MON4D3/LuaSnip' },
			{ 'saadparwaiz1/cmp_luasnip' }
		}
	}

	use {
		'mhartington/formatter.nvim',
		config = function()
			require('plugins.lang.format')
		end
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('plugins.lang.highlight')
		end
	}
end

return P
