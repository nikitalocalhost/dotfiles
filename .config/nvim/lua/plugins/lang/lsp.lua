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

local on_attach = function(client, buffer)
	if client.resolved_capabilities.document_formatting then
		vim.api.nvim_exec(
			[[
				augroup LspAutocommands
				  autocmd! * <buffer>
				  autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
				augroup END
			]],
			true
		)
	end
end

local default_config = {
	on_attach = on_attach
}

if not vim.env.OPAMROOT then
	vim.env.OPAMROOT = "~/.opam"
end

local format_config = require("plugins.lang.format")

local configs = {
	diagnosticls = {
		filetypes = format_config.filetypes,
		init_options = format_config.options
	},
	lua = {
		settings = {
			Lua = {
				diagnostics = {
					globals = {"vim"}
				}
			}
		}
	},
	-- ocamlls = {
	-- 	root_dir = lsp.util.root_pattern(".merlin", "package.json", "dune")
	-- 	-- cmd = {vim.env.OPAMROOT .. "/default/bin/ocamllsp"}
	-- },
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
		server:setup(coq.lsp_ensure_capabilities(opts))
		vim.cmd [[ do User LspAttachBuffers ]]
	end
)
