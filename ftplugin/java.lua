-- Java JDTLS
local config = require('plugins.lsp.config').build_config()
local home = os.getenv('HOME')
local downloads = home .. '/Downloads'
local jdk11 = downloads .. '/jdk-11.0.15'
local jdk18 = downloads .. '/jdk-18.0.1.1'

local jdtls = downloads .. '/jdtls'
local jar = jdtls .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
local config_sys = jdtls .. '/config_win'
local root_markers = { 'gradlew', 'mvnw', '.git' }
local root_dir = require('jdtls.setup').find_root(root_markers)
local workspace = home .. '/eclipse-workspace/' .. vim.fn.fnamemodify(root_dir, ':p:h:t')

config.cmd = {
	-- 💀
	jdk11 .. '/bin/java.exe', -- or '/path/to/java11_or_newer/bin/java'
	-- depends on if `java` is in your $PATH env variable and if it points to the right version.

	'-Declipse.application=org.eclipse.jdt.ls.core.id1',
	'-Dosgi.bundles.defaultStartLevel=4',
	'-Declipse.product=org.eclipse.jdt.ls.core.product',
	'-Dlog.protocol=true',
	'-Dlog.level=ALL',
	'-Xms1g',
	'--add-modules=ALL-SYSTEM',
	'--add-opens', 'java.base/java.util=ALL-UNNAMED',
	'--add-opens', 'java.base/java.lang=ALL-UNNAMED',

	-- 💀
	'-jar', jar,

	-- 💀
	'-configuration', config_sys,

	-- 💀
	-- See `data directory configuration` section in the README
	'-data', workspace
}

config.settings = {
	java = {
		signatureHelp = {
			enabled = true
		};
		sources = {
			organizeImports = {
				starThreshold = 9999;
				staticStarThreshold = 9999;
			};
		};
	},
	init_options = {
		bundles = {}
	},
}

config.on_attach = function(client, bufnr)
	require('plugins.lsp.config').on_attach(client, bufnr)
	require('jdtls.setup').add_commands()
end

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)

