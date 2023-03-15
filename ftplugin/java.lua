-- Java JDTLS
local config = {}
local home = os.getenv('HOME') or ('C:\\Users\\' .. os.getenv('USERNAME'))
local work_dir = home .. '/Workspace/tools/java'
local jdk17 = work_dir .. '/jdk-17.0.6'
local jdk18 = work_dir .. '/jdk-18.0.1.1'

local jdtls = work_dir .. '/jdtls'
local jar = jdtls .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
local config_sys = jdtls .. '/config_win'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace = home .. '/Workspace/java/' .. project_name
local masonDir = home .. '/AppData/Local/nvim-data/mason'

config.cmd = {
	-- 💀
	jdk17 .. '/bin/java.exe', -- or '/path/to/java11_or_newer/bin/java'

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
	'-javaagent:' .. home .. '/Workspace/tools/editor/eclipse/lombok.jar',

	-- 💀
	'-jar', jar,

	-- 💀
	'-configuration', config_sys,

	-- 💀
	-- See `data directory configuration` section in the README
	'-data', workspace
}

local bundles = {
	vim.fn.glob(masonDir .. '/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar', true)
}

vim.list_extend(bundles, vim.split(vim.fn.glob(masonDir .. '/packages/java-test/extension/server/*.jar', true), "\n"))

config.root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'gradlew', 'mvnw' }, { upward = true })[1])

config.settings = {
	['java.format.settings.url'] = '/f/java-test/eclipse-java-google-style.xml',
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
					path = jdk17
				},
				{
					name = "JavaSE-18",
					path = jdk18
				}
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

config.init_options = {
	bundles = bundles,
	jvm_args = '-javaagent:' .. home .. '/Workspace/tools/editor/eclipse/lombok.jar',
}

config.on_attach = function(client, bufnr)
	require('jdtls').setup_dap({ hotcodereplace = 'auto' })
	require('jdtls.setup').add_commands()
end

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
