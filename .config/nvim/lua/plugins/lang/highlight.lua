require'nvim-treesitter.configs'.setup {
	ensure_installed = 'maintained', -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = {},
	highlight = {
		enable = true,
		disable = {'yaml'},
		additional_vim_regex_highlighting = false,
	},
}

