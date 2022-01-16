local M = {}

local eslint = {
	rootPatterns = {
		".git",
		"package.json",
		".eslintrc.json"
	},
	command = "./node_modules/.bin/eslint",
	args = {
		"--stdin",
		"--stdin-filename",
		"%filepath",
		"--format",
		"json"
	},
	sourceName = "eslint",
	parseJson = {
		errorsRoot = "[0].messages",
		line = "line",
		column = "column",
		endLine = "endLine",
		endColumn = "endColumn",
		message = "${message} [${ruleId}]",
		security = "severity"
	},
	securities = {
		[2] = "error",
		[1] = "warning"
	}
}

local stylelint = {
	rootPatterns = {
		".git",
		"package.json"
	},
	command = "./node_modules/.bin/stylelint",
	args = {
		"--formatter",
		"json",
		"--stdin-filename",
		"%filepath"
	},
	sourceName = "stylelint",
	parseJson = {
		errorsRoot = "[0].warnings",
		line = "line",
		column = "column",
		message = "${text}",
		security = "severity"
	},
	securities = {
		error = "error",
		warning = "warning"
	}
}

local credo = {
	rootPatterns = {
		".git",
		"mix.exs",
		".credo.exs"
	},
	command = "mix",
	args = {"credo", "suggest", "--format", "flycheck", "--read-from-stdin"},
	sourceName = "credo",
	offsetLine = 0,
	offsetColumn = 0,
	formatLines = 1,
	formatPattern = {
		"^[^ ]+?:([0-9]+)(:([0-9]+))?:\\s+([^ ]+):\\s+(.*)(\\r|\\n)*$",
		{
			line = 1,
			column = 3,
			security = 4,
			message = 5
		}
	},
	securities = {
		F = "warning",
		C = "warning",
		D = "info",
		R = "info"
	}
}

local prettier = {
	rootPatterns = {
		".git",
		"package.json",
		".prettierrc",
		".prettierrc.json"
	},
	command = "prettier",
	args = {"--stdin-filepath", "%filepath"},
	sourceName = "prettier"
}

local luafmt = {
	command = "luafmt",
	args = {
		"--use-tabs",
		"--indent-count",
		4,
		"--stdin",
		"%filepath"
	},
	sourceName = "luafmt"
}

M.options = {
	linters = {
		eslint = eslint,
		stylelint = stylelint,
		credo = credo
	},
	formatters = {
		prettier = prettier,
		luafmt = luafmt
	},
	filetypes = {
		javascript = "eslint",
		javascriptreact = "eslint",
		typescript = "eslint",
		typescriptreact = "eslint",
		css = "stylelint",
		sass = "stylelint",
		scss = "stylelint",
		elixir = "credo",
		eelixir = "credo"
	},
	formatFiletypes = {
		javascript = "prettier",
		javascriptreact = "prettier",
		typescript = "prettier",
		typescriptreact = "prettier",
		json = "prettier",
		scss = "prettier",
		less = "prettier",
		markdown = "prettier",
		lua = "luafmt"
	}
}

M.filetypes = vim.tbl_keys(vim.tbl_extend("keep", M.options.filetypes, M.options.formatFiletypes))

return M
