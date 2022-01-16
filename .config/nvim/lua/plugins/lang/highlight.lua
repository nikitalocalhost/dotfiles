require "nvim-treesitter.configs".setup {
	ignore_install = {},
	highlight = {
		enable = true,
		disable = {"yaml"},
		additional_vim_regex_highlighting = false
	}
}
