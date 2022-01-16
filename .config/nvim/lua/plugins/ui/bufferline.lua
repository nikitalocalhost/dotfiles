local set = vim.opt

set.termguicolors = true

require('bufferline').setup({
	options = {
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = true,
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or " "
			return icon..count
		end
	},
	extensions = {
		'nvim-tree'
	}
})
