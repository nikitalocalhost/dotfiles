pcall(require, 'impatient')
pcall(require, 'compiled')

local fn = vim.fn

local function load_packer()
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd 'packadd packer.nvim'
	end
end

local function load_plugins()
	local plugins_path = fn.stdpath('config')..'/lua/plugins'

	local plugins = {}
	local plugin_files = fn.glob(plugins_path..'/*')
	for file in string.gmatch(plugin_files, '([^\n]+)') do
		local filepath = fn.split(file, '/')
		local plugin = fn.split(filepath[#filepath], '\\.')[1]
		table.insert(plugins, 'plugins.'..plugin)
	end

	return require('packer').startup({
		function(use)
			use {'wbthomason/packer.nvim'}
			use 'lewis6991/impatient.nvim'
			for _, plugin in ipairs(plugins) do
				require(plugin).init(use)
			end
		end,
		config = {
			display = {
				open_fn = require('packer.util').float
			},
			compile_path = fn.stdpath('config')..'/lua/compiled.lua'
		}
	})
end

load_packer()


return load_plugins()

