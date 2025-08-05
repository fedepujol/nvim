---@module "lazy"
---@type LazyPluginSpec
return {
	'rcarriga/nvim-dap-ui',
	dependencies = {
		'mfussenegger/nvim-dap',
		'nvim-neotest/nvim-nio',
		'theHamsta/nvim-dap-virtual-text',
	},
	keys = {
		-- stylua: ignore
		{ '<F4>', function() require('dap').continue() end, desc = 'Debug: Continue', },
		-- stylua: ignore
		{ '<F6>', function() require('dap').step_over() end, desc = 'Debug: Step Over', },
		-- stylua: ignore
		{ '<F5>', function() require('dap').step_into() end, desc = 'Debug: Step Into', },
		-- stylua: ignore
		{ '<F8>', function() require('dap').step_out() end, desc = 'Debug: Step Out',},
		-- stylua: ignore
		{ '<leader>db', function() require('dap').toggle_breakpoint() end, desc = 'Debug: Toggle Breakpoint', },
	},
	config = function()
		local dap = require('dap')
		local dapui = require('dapui')

		vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })

		require('nvim-dap-virtual-text').setup({})

		require('dapui').setup({
			icons = {
				expanded = '',
				collapsed = '',
				current_frame = '*',
			},
			controls = {
				icons = {
					pause = '',
					play = '',
					step_back = '',
					step_into = '',
					step_over = '',
					step_out = '',
					run_last = '',
					terminate = '',
				},
			},
			layouts = {
				{
					elements = {
						{ id = 'scopes', size = 0.75 },
						{ id = 'breakpoints', size = 0.25 },
					},
					position = 'right',
					size = 40,
				},
				{
					elements = {
						{ id = 'console', size = 1 },
					},
					position = 'bottom',
					size = 10,
				},
			},
		})

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
