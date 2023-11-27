-- Buffer Options
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

-- Java JDTLS
local config = {}

---@class JavaUtils
local paths = require('utils')

local jdtls = require('jdtls')

config.cmd = {
	paths.jdtlsPaths.jdk.v17 .. '/bin/java.exe',
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
	'-javaagent:' .. paths.workspace .. '/tools/eclipse/plugins/org.projectlombok.agent_1.18.30/lombok.jar',
	'-jar', paths.jdtlsPaths.jar,
	'-configuration', paths.jdtlsPaths.config_sys,
	'-data', paths.jdtlsPaths.project
}

local bundles = {
	vim.fn.glob(paths.mason .. '/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar',
		true)
}

vim.list_extend(bundles, vim.split(vim.fn.glob(paths.mason .. '/packages/java-test/extension/server/*.jar', true), "\n"))

config.root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'gradlew', 'mvnw' }, { upward = true })[1])

config.settings = {
	-- ['java.format.settings.url'] = paths.workspace .. '/java/google-format.xml',
	-- ['java.format.settings.profile'] = 'GoogleStyle',
	java = {
		configuration = {
			runtimes = {
				{
					name = "JavaSE-1.8",
					path = paths.jdtlsPaths.jdk.v8,
					default = true,
				},
				{
					name = "JavaSE-11",
					path = paths.jdtlsPaths.jdk.v11
				},
				{
					name = "JavaSE-17",
					path = paths.jdtlsPaths.jdk.v17
				},
				{
					name = "JavaSE-21",
					path = paths.jdtlsPaths.jdk.v21
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
	jvm_args = '-javaagent:' .. paths.workspace .. '/tools/eclipse/plugins/org.projectlombok.agent_1.18.30/lombok.jar',
	extendedClientCapabilities = extendedClientCapabilities
}

config.on_attach = function(client, bufnr)
	jdtls.setup_dap()
end

config.capabilities = vim.lsp.protocol.make_client_capabilities()

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)
