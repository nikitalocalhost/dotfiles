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
			}
		}
	}
)

vim.api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.rs,*.lua FormatWrite
augroup END
]],
	true
)
