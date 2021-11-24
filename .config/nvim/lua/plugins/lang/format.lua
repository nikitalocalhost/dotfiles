local prettier_config = function()
	return {
		exe = "prettier",
		args = {
			"--stdin-filepath",
			vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
		},
		stdin = true
	}
end

require("formatter").setup(
	{
		filetype = {
			lua = {
				function()
					return {
						exe = "luafmt",
						args = {
							"--use-tabs",
							"--indent-count",
							4,
							"--stdin"
						},
						stdin = true
					}
				end
			},
			elixir = {
				function()
					return {
						exe = "mix",
						args = {
							"format",
							"-"
						},
						stdin = true
					}
				end
			},
			json = {
				prettier_config
			},
			javascript = {
				prettier_config
			},
			typescript = {
				prettier_config
			}
		}
	}
)

vim.api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.lua,*.ex,*.exs,*.json,*.js,*.ts,*.jsx,*.tsx FormatWrite
augroup END
]],
	true
)
