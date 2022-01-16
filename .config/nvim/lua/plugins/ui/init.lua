local P = {}

function P.init(use)
	use {
		"nvim-telescope/telescope.nvim",
		requires = {
			{"nvim-lua/plenary.nvim"},
			{"nvim-lua/popup.nvim"},
			{
				"kyazdani42/nvim-web-devicons",
				optional = true
			},
			{
				"sudormrfbin/cheatsheet.nvim",
				config = function()
					require("plugins.ui.cheatsheet")
				end
			}
		}
	}

	-- use {
	-- 	'hoob3rt/lualine.nvim',
	-- 	config = function()
	-- 		require('lualine').setup({
	-- 			options = {
	-- 				theme = 'nord'
	-- 			}
	-- 		})
	-- 	end,
	-- 	requires = {
	-- 		{
	-- 			'kyazdani42/nvim-web-devicons',
	-- 			opt = true
	-- 		}
	-- 	}
	-- }

	use {
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
			require("telescope").load_extension("projects")
		end
	}

	use {
		"glepnir/galaxyline.nvim",
		branch = "main",
		requires = {
			"kyazdani42/nvim-web-devicons"
		},
		config = function()
			require("plugins.ui.line")
		end
	}

	use {
		"akinsho/bufferline.nvim",
		config = function()
			require("plugins.ui.bufferline")
		end,
		requires = {
			"kyazdani42/nvim-web-devicons"
		}
	}

	use {
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("plugins.ui.tree")
		end,
		requires = {
			"kyazdani42/nvim-web-devicons"
		}
	}

	use {
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.opt.list = true
			vim.opt.listchars:append("space:⋅")
			vim.opt.listchars:append("eol:↴")
			require("indent_blankline").setup(
				{
					space_char_blankline = " ",
					buftype_exclude = {"terminal"},
					show_current_context = true
				}
			)
		end
	}

	use {
		"shaunsingh/nord.nvim",
		config = function()
			vim.cmd [[colorscheme nord]]
		end
	}
	-- use {
	-- 	'shaunsingh/nord.nvim',
	-- 	config = function()
	-- 		vim.cmd[[colorscheme nord]]
	-- 	end
	-- }
end

return P
