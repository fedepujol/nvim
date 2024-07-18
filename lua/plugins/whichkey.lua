-- WhichKey
return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	config = function()
		require('which-key').setup({
			preset = 'helix',
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
			icons = {
				group = '+',
			},
			show_help = true,
			show_keys = true,
		})

		local wk = require('which-key')

		-- stylua: ignore
		wk.add({
			{ '<leader>s',   group = 'Settings' },
			{ '<leader>sc',  ':CmpStatus<CR>',                                    desc = 'Completion Status' },
			{ '<leader>sh',  ':checkhealth<CR>',                                  desc = 'Neovim Health' },
			{ '<leader>sl',  ':Lazy<CR>',                                         desc = 'Lazy Info' },
			{ '<leader>sm',  ':Mason<CR>',                                        desc = 'Mason Info' },

			{ '<leader>st',  group = "TreeSitter" },
			{ '<leader>stm', ':TSModuleInfo<CR>',                                 desc = 'Module Info' },
			{ '<leader>sti', ':TSInstallInfo<CR>',                                desc = 'Install Info' },

			{ '<leader>b',   group = "Buffers" },
			{ '<leader>bc',  group = "Close" },
			{ '<leader>bca', ':BufferCloseAllButCurrent<CR>',                     desc = 'All But Current' },
			{ '<leader>bcc', ':BufferClose!<CR>',                                 desc = 'Current Buffer' },
			{ '<leader>bcp', ':BufferCloseAllButPinned<CR>',                      desc = 'All But Pinned' },
			{ '<leader>bm',  group = "Move" },
			{ '<leader>bmf', ':BufferMoveNext<CR>',                               desc = 'Forwards' },
			{ '<leader>bmb', ':BufferMovePrevious<CR>',                           desc = 'Backwards' },
			{ '<leader>bp',  ':BufferPick<CR>',                                   desc = 'Pick' },
			{ '<leader>bo',  ':Neotree float buffers<CR>',                        desc = 'Show Open Buffers' },

			{ '<leader>f',   group = "Files" },
			{ '<leader>fa',  ':normal!gg0vG$<CR>',                                desc = 'Select all' },
			{ '<leader>fb',  ':normal!$x<CR>',                                    desc = 'Delete last character' },

			{ '<leader>i',   group = "Icons" },
			{ '<leader>is',  '<CMD>Nerdy<CR>',                                    desc = 'Search icons' },

			{ '<leader>g',   group = "Git" },
			{ '<leader>gb',  "<cmd>lua require('gitsigns').blame_line()<CR>",     desc = 'Blame Line' },
			{ '<leader>gh',  group = "Hunks" },
			{ '<leader>ghj', "<cmd>lua require('gitsigns').next_hunk()<CR>",      desc = 'Next Hunk' },
			{ '<leader>ghJ', "<cmd>lua require('gitsigns').prev_hunk()<CR>",      desc = 'Prev Hunk' },
			{ '<leader>ghp', "<cmd>lua require('gitsigns').preview_hunk()<CR>",   desc = 'Preview Hunk' },
			{ '<leader>ghr', "<cmd>lua require('gitsigns').reset_hunk()<CR>",     desc = 'Reset Hunk' },
			{ '<leader>ghR', "<cmd>lua require('gitsigns').reset_buffer()<CR>",   desc = 'Reset Buffer' },

			{ '<leader>l',   group = "Lsp" },
			{ '<leader>li',  ':LspInfo<CR>',                                      desc = "Info" },
			{ '<leader>lb',  group = "Buffer" },
			{ '<leader>lbi', '<cmd>lua vim.lsp.buf.implementation()<CR>',         desc = 'Go to Implementation' },
			{ '<leader>lbs', '<cmd>lua vim.lsp.buf.document_symbol()<CR>',        desc = 'Document Symbol' },
			{ '<leader>lbt', '<cmd>lua vim.lsp.buf.type_definition()<CR>',        desc = 'Go to Type-Definition' },
			{ '<leader>lbf', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', desc = 'Format' },
			{ '<leader>lbh', '<cmd>lua vim.lsp.buf.signature_help()<CR>',         desc = 'Get Signature Help' },
			{ '<leader>lbr', ':Telescope lsp_references<CR>',                     desc = 'Show References' },
			{ '<leader>ld',  group = "Diagnostics" },
			{ '<leader>ldn', '<cmd>lua vim.diagnostic.goto_next()<CR>',           desc = 'Next Diagnostic' },
			{ '<leader>ldp', '<cmd>lua vim.diagnostic.goto_prev()<CR>',           desc = 'Prev. Diagnostic' },
			{ '<leader>lts', ':Trouble symbols<CR>',                              desc = 'Symbols' },

			{ '<leader>t',   group = "Terminal" },
			{ '<leader>tt',  ':ToggleTerm<CR>',                                   desc = 'Toggle Terminal' },
			{ '<leader>ts',  ':TermSelect<CR>',                                   desc = 'Select Terminal' },
		})

		wk.add({
			{ '<leader>u', group = 'Utilities' },
			{ '<leader>ul', ':normal!$x<CR>', desc = 'Delete last character', mode = 'v' },
		})
	end,
}
