local P = {}

function P.init(use)
	use {
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lang.lsp")
		end,
		requires = {
			{"williamboman/nvim-lsp-installer"},
			{"mattn/efm-langserver"}
		}
	}

	-- use {
	-- 	"hrsh7th/nvim-cmp",
	-- 	config = function()
	-- 		require("plugins.lang.compe")
	-- 	end,
	-- 	requires = {
	-- 		{"hrsh7th/cmp-nvim-lsp"},
	-- 		{"hrsh7th/cmp-buffer"},
	-- 		{"hrsh7th/nvim-cmp"},
	-- 		{"L3MON4D3/LuaSnip"},
	-- 		{"saadparwaiz1/cmp_luasnip"}
	-- 	}
	-- }
	use {
		"ms-jpq/coq_nvim",
		branch = "coq",
		run = ":COQdeps",
		requires = {
			{
				"ms-jpq/coq.artifacts",
				branch = "artifacts"
			},
			{
				"ms-jpq/coq.thirdparty",
				branch = "3p"
			}
		}
	}

	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("plugins.lang.highlight")
		end
	}

	use {
		"tami5/lspsaga.nvim",
		config = function()
			local saga = require "lspsaga"
			saga.init_lsp_saga()
		end
	}

	use {
		"TimUntersberger/neogit",
		config = function()
			require("neogit").setup({})
		end,
		requires = {
			{"nvim-lua/plenary.nvim"}
		}
	}
end

return P
