-- WhichKey
return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	config = function()
		require('which-key').setup({
			plugins = {
				spelling = {
					enable = false,
				},
				presets = {
					operators = false,
					motions = true,
					text_objects = true,
					widnows = true,
					nav = true,
					z = true,
					g = true,
				},
			},
			key_labels = {
				['<space>'] = 'SPC',
				['<CR>'] = 'RET',
				['<Tab>'] = 'TAB',
				['<leader>'] = 'LEAD',
			},
			icons = {
				group = ' ',
			},
			window = {
				border = 'single',
				position = 'bottom',
			},
			show_help = true,
		})

		local wk = require('which-key')

		wk.register({
			s = {
				name = 'Settings',
				c = { ':CmpStatus<CR>', 'Completion Status' },
				h = { ':checkhealth<CR>', 'Neovim Health' },
				l = { ':Lazy<CR>', 'Lazy Info' },
				m = { ':Mason<CR>', 'Mason Info' },
				t = {
					name = 'TreeSitter',
					m = { ':TSModuleInfo<CR>', 'Module Info' },
					i = { ':TSInstallInfo<CR>', 'Install Info' },
				},
			},
			b = {
				name = 'Buffers',
				c = {
					name = 'Close',
					a = { ':BufferCloseAllButCurrent<CR>', 'All But Current' },
					c = { ':BufferClose!<CR>', 'Current Buffer' },
					l = { ':BufferCloseBuffersLeft<CR>', 'All Left Buffers' },
					p = { ':BufferCloseAllButPinned<CR>', 'All But Pinned' },
					r = { ':BufferCloseBuffersRight<CR>', 'All Right Buffers' },
				},
				m = {
					name = 'Move Buffer',
					f = { ':BufferMoveNext<CR>', 'Forwards' },
					b = { ':BufferMovePrevious<CR>', 'Backwards' },
				},
				s = {
					name = 'Sort',
					b = { ':BufferOrderByBufferNumber<CR>', 'Buffer Number' },
					d = { ':BufferOrderByDirectory<CR>', 'Directory' },
					l = { ':BufferOrderByLanguage<CR>', 'Language' },
					w = { ':BufferOrderByWindowNumber<CR>', 'Window Number' },
				},
				p = { ':BufferPick<CR>', 'Pick' },
				o = { ':Neotree float buffers<CR>', 'Show Open Buffers' },
			},
			f = {
				name = 'Files',
				a = { ':normal!gg0vG$<CR>', 'Select all' },
				d = { ':normal!$x<CR>', 'Delete last character' },
			},
			g = {
				name = 'Git',
				b = { "<cmd>lua require('gitsigns').blame_line()<CR>", 'Blame Line' },
				h = {
					name = 'Hunk',
					j = { "<cmd>lua require('gitsigns').next_hunk()<CR>", 'Next Hunk' },
					J = { "<cmd>lua require('gitsigns').prev_hunk()<CR>", 'Prev Hunk' },
					p = { "<cmd>lua require('gitsigns').preview_hunk()<CR>", 'Preview Hunk' },
					r = { "<cmd>lua require('gitsigns').reset_hunk()<CR>", 'Reset Hunk' },
					R = { "<cmd>lua require('gitsigns').reset_buffer()<CR>", 'Reset Buffer' },
				},
			},
			l = {
				name = 'LSP',
				i = { ':LspInfo<CR>', 'Info' },
				b = {
					name = 'Buffer',
					i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Go to Implementation' },
					s = { '<cmd>lua vim.lsp.buf.document_symbol()<CR>', 'Document Symbol' },
					t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Go to Type-Definition' },
					f = { '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', 'Format' },
					h = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Get Signature Help' },
					r = { ':Telescope lsp_references<CR>', 'Show References' },
				},
				d = {
					name = 'Diagnostics',
					n = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Next Diagnostic' },
					p = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Prev. Diagnostic' },
				},
			},
			t = {
				name = 'Terminal',
				t = { ':ToggleTerm<CR>', 'Toggle Terminal' },
				s = { ':TermSelect<CR>', 'Select Terminal' },
			},
		}, { mode = 'n', prefix = '<leader>', noremap = true, silent = true })

		wk.register({
			u = {
				name = 'Utilities',
				l = { ':normal!$x<CR>', 'Delete last character' },
			},
		}, { mode = 'v', prefix = '<leader>', noremap = true, silent = true })
	end,
}
