-- Buffer Options
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

-- Java JDTLS
local config = {}
local paths = require('utils')
local jdtlsPaths = paths.jdtlsPaths()
local jdtls = require('jdtls')

config.cmd = {
	-- 💀 or '/path/to/java11_or_newer/bin/java'
	jdtlsPaths.jdk .. '/bin/java.exe',
	'-Declipse.application=org.eclipse.jdt.ls.core.id1',
	'-Dosgi.bundles.defaultStartLevel=4',
	'-Declipse.product=org.eclipse.jdt.ls.core.product',
	'-Dlog.protocol=true',
	'-Dlog.level=ALL',
	'-Xms1g',
	'--add-modules=ALL-SYSTEM',
	'--add-opens', 'java.base/java.util=ALL-UNNAMED',
	'--add-opens', 'java.base/java.lang=ALL-UNNAMED',

	-- lombok
	'-javaagent:' .. paths.workspace .. '/tools/editor/eclipse/lombok.jar',
	'-jar', jdtlsPaths.jar,
	'-configuration', jdtlsPaths.config_sys,
	'-data', jdtlsPaths.project
}

local bundles = {
	vim.fn.glob(paths.mason .. '/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar',
		true)
}

vim.list_extend(bundles, vim.split(vim.fn.glob(paths.mason .. '/packages/java-test/extension/server/*.jar', true), "\n"))

config.root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'gradlew', 'mvnw' }, { upward = true })[1])

config.settings = {
	['java.format.settings.url'] = paths.workspace .. '/java/g-format.xml',
	['java.format.settings.profile'] = 'GoogleStyle',
	java = {
		configuration = {
			runtimes = {
				{
					name = "JavaSE-1.8",
					path = "/Program Files/Java/jdk1.8.0_333/",
					default = true,
				},
				{
					name = "JavaSE-17",
					path = jdtlsPaths.jdk
				},
			}
		},
		signatureHelp = {
			enabled = true
		},
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
	},
}

local extendedClientCapabilities = jdtls.extendedClientCapabilities;
extendedClientCapabilities.onCompletionItemSelectedCommand = "editor.action.triggerParameterHints"
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

config.init_options = {
	bundles = bundles,
	jvm_args = '-javaagent:' .. paths.workspace .. '/tools/editor/eclipse/lombok.jar',
	extendedClientCapabilities = extendedClientCapabilities
}

config.on_attach = function(client, bufnr)
	jdtls.setup_dap({ hotcodereplace = 'auto' })
	jdtls.setup.add_commands()
end

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)
