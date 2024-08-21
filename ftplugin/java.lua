-- Buffer Options
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

-- Java JDTLS
local config = {}

---@class JavaUtils
local paths = require('utils')

local jdtls = require('jdtls')
local jdtls_dap = require('jdtls.dap')

config.cmd = {
	paths.jdtlsPaths.jdk.v17 .. '/bin/java.exe',
	'-Declipse.application=org.eclipse.jdt.ls.core.id1',
	'-Dosgi.bundles.defaultStartLevel=4',
	'-Declipse.product=org.eclipse.jdt.ls.core.product',
	'-Dlog.protocol=true',
	'-Dlog.level=ALL',
	'-Xms1g',
	'--add-modules=ALL-SYSTEM',
	'--add-opens',
	'java.base/java.util=ALL-UNNAMED',
	'--add-opens',
	'java.base/java.lang=ALL-UNNAMED',

	-- lombok
	'-javaagent:'
		.. paths.workspace
		.. '/tools/eclipse/plugins/org.projectlombok.agent_1.18.30/lombok.jar',
	'-jar',
	paths.jdtlsPaths.jar,
	'-configuration',
	paths.jdtlsPaths.config_sys,
	'-data',
	paths.jdtlsPaths.project,
}

local bundles = {
	vim.fn.glob(
		paths.mason
			.. '/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar',
		true
	),
}

vim.list_extend(
	bundles,
	vim.split(vim.fn.glob(paths.mason .. '/packages/java-test/extension/server/*.jar', true), '\n')
)

config.root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'gradlew', 'mvnw' }, { upward = true })[1])

config.settings = {
	java = {
		autoBuild = {
			enabled = false,
		},
		maxConcurrentBuilds = 4,
		format = {
			enabled = true,
			settings = {
				url = paths.workspace .. '/java/g-format.xml',
				profile = 'GoogleStyle',
			},
		},
		configuration = {
			runtimes = {
				{
					name = 'JavaSE-1.8',
					path = paths.jdtlsPaths.jdk.v8,
					default = true,
				},
				{
					name = 'JavaSE-11',
					path = paths.jdtlsPaths.jdk.v11,
				},
				{
					name = 'JavaSE-17',
					path = paths.jdtlsPaths.jdk.v17,
				},
			},
		},
		signatureHelp = {
			enabled = true,
		},
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
	},
}

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.onCompletionItemSelectedCommand = 'editor.action.triggerParameterHints'
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local capabilities = vim.tbl_deep_extend(
	'force',
	vim.lsp.protocol.make_client_capabilities(),
	require('cmp_nvim_lsp').default_capabilities(),
	{
		workspace = {
			didChangeConfiguration = { dynamicRegistration = true },
			didChangeWatchedFiles = { dynamicRegistration = true },
			didChangeWorkspaceFolders = { dynamicRegistration = true },
		},
	},
	{
		textDocument = {
			foldingRange = {
				dynamicRegistration = true,
				lineFoldingOnly = true,
			},
		},
	}
)

config.init_options = {
	bundles = bundles,
	jvm_args = '-javaagent:'
		.. paths.workspace
		.. '/tools/eclipse/plugins/org.projectlombok.agent_1.18.30/lombok.jar',
	extendedClientCapabilities = extendedClientCapabilities,
}

config.on_attach = function(_, bufnr)
	jdtls.setup_dap()
	jdtls_dap.setup_dap_main_class_configs()

	vim.keymap.set('n', '<F4>', function()
		require('dap').continue()
	end, { noremap = true, silent = true, buffer = bufnr, desc = 'Continue' })

	vim.keymap.set('n', '<F6>', function()
		require('dap').step_over()
	end, { noremap = true, silent = true, buffer = bufnr, desc = 'Step Over' })
	vim.keymap.set('n', '<F5>', function()
		require('dap').step_into()
	end, { noremap = true, silent = true, buffer = bufnr, desc = 'Step Into' })
	vim.keymap.set('n', '<F8>', function()
		require('dap').step_out()
	end, { noremap = true, silent = true, buffer = bufnr, desc = 'Step Out' })
	vim.keymap.set('n', '<Leader>jbt', function()
		require('dap').toggle_breakpoint()
	end, { noremap = true, silent = true, buffer = bufnr, desc = 'Toggle Breakpoint' })

	vim.keymap.set('n', '<Leader>jbs', function()
		require('dap').set_breakpoint()
	end, { noremap = true, silent = true, buffer = bufnr, desc = 'Set Breakpoint' })

	vim.keymap.set('n', '<Leader>jro', function()
		require('dap').repl.open()
	end, { noremap = true, silent = true, buffer = bufnr, desc = 'Open Repl' })

	vim.keymap.set({ 'n', 'v' }, '<Leader>jdh', function()
		require('dap.ui.widgets').hover()
	end, { noremap = true, silent = true, buffer = bufnr, desc = 'Widgets Hover' })

	vim.keymap.set({ 'n', 'v' }, '<Leader>jdp', function()
		require('dap.ui.widgets').preview()
	end, { noremap = true, silent = true, buffer = bufnr, desc = 'Widgets Preview' })

	vim.keymap.set('n', '<Leader>jdf', function()
		local widgets = require('dap.ui.widgets')
		widgets.centered_float(widgets.frames)
	end, { noremap = true, silent = true, buffer = bufnr, desc = 'Widgets Centered' })

	vim.keymap.set('n', '<Leader>jds', function()
		local widgets = require('dap.ui.widgets')
		widgets.centered_float(widgets.scopes)
	end, { noremap = true, silent = true, buffer = bufnr })
end

config.capabilities = capabilities
config.handlers = {
	['language/status'] = function() end,
}

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)
