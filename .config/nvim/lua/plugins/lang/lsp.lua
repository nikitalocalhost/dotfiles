require('lspinstall').setup()

local default_config = {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

local configs = {
	lua = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim' }
				}
			}
		}
	}
}

local function setup_servers()
	local servers = require('lspinstall').installed_servers()
	for _, server in pairs(servers) do
		local config = configs[server]
		if config then
			config = vim.tbl_deep_extend("force", default_config, config)
		else
			config = default_config
		end
		require('lspconfig')[server].setup(config)
	end
end

setup_servers()

require('lspinstall').post_install_hook = function()
	setup_servers()
	vim.cmd('bufdo e')
end
