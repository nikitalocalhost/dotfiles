local lsp = require("lspconfig")

vim.g.coq_settings = {
	auto_start = "shut-up",
	xdg = true
}
local coq = require("coq")
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings(
	{
		log_level = vim.log.levels.WARN
	}
)

local default_config = coq.lsp_ensure_capabilities({})

local configs = {
	lua = {
		settings = {
			Lua = {
				diagnostics = {
					globals = {"vim"}
				}
			}
		}
	},
	ocamlls = {
		root_dir = lsp.util.root_pattern(".merlin", "package.json", "dune")
	},
	elixirls = {
		cmd = {vim.fn.stdpath("data") .. "/lsp_servers/elixir/elixir-ls/language_server.sh"}
	}
}

lsp_installer.on_server_ready(
	function(server)
		local opts = configs[server.name]
		if opts then
			opts = vim.tbl_deep_extend("force", default_config, opts)
		else
			opts = default_config
		end
		server:setup(opts)
		vim.cmd [[ do User LspAttachBuffers ]]
	end
)
