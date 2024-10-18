return {
	'rcarriga/nvim-dap-ui',
	dependencies = {
		'mfussenegger/nvim-dap',
		'nvim-neotest/nvim-nio',
		'theHamsta/nvim-dap-virtual-text'
	},
	keys = function(_, keys)
		local dap = require('dap')
		return {
			{ '<F4>',       dap.continue,          { desc = 'Debug: Continue' } },
			{ '<F6>',       dap.step_over,         { desc = 'Debug: Step Over' } },
			{ '<F5>',       dap.step_into,         { desc = 'Debug: Step Into' } },
			{ '<F8>',       dap.step_out,          { desc = 'Debug: Step Out' } },
			{ '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' } },
			unpack(keys)
		}
	end,
	config = function()
		local dap = require('dap')
		local dapui = require('dapui')

		vim.fn.sign_define('DapBreakpoint', { text = "", texthl = "", linehl = "", numhl = "" })

		require('nvim-dap-virtual-text').setup({})

		require('dapui').setup({
			icons = {
				expanded = "",
				collapsed = "",
				current_frame = "*"
			},
			controls = {
				icons = {
					pause = "",
					play = "",
					step_back = "",
					step_into = "",
					step_over = "",
					step_out = "",
					run_last = "",
					terminate = "",
				}
			},
			layouts = { {
				elements = {
					{ id = "scopes",      size = 0.75 },
					{ id = "breakpoints", size = 0.25 }
				},
				position = "right",
				size = 40
			}, {
				elements = {
					{ id = "console", size = 1 }
				},
				position = "bottom",
				size = 10
			} },
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
	end
}
