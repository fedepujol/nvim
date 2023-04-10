-- WhichKey
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
	window = {
		border = 'none',
		position = 'bottom',
	},
	show_help = true,
	hidden = { '<silent>', '<cmd>', '<CMD>', '<CR>', 'lua', '^:' },
})

local wk = require('which-key')

wk.register({
	s = {
		name = 'Settings',
		h = { ':checkhealth<CR>', 'Neovim Health' },
		l = { ':Lazy<CR>', 'Lazy Info' },
		m = { ':Mason<CR>', 'Mason Info' },
		o = { ':CmpStatus<CR>', 'Completion Status' },
		t = {
			name = 'TreeSitter',
			m = { ':TSModuleInfo<CR>', 'Module Info' },
			i = { ':TSInstallInfo<CR>', 'Install Info' },
		},
		v = { ':Telescope vim_options<CR>', 'Vim Options' },
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
			name = "Move Buffer",
			f = { ':BufferMoveNext<CR>', 'Forwards' },
			b = { ':BufferMovePrevious<CR>', 'Backwards' }
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
		g = { ":Telescope live_grep<CR>", "Live Grep" },
		h = { ":Telescope help_tags<CR>", "Find Help" },
		p = { "<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>", "Find Files" },
	},
	g = {
		name = 'Git',
		h = {
			name = 'Hunk',
			j = { "<cmd>lua require('gitsigns').next_hunk()<CR>", 'Next Hunk' },
			J = { "<cmd>lua require('gitsigns').prev_hunk()<CR>", 'Prev Hunk' },
			p = { "<cmd>lua require('gitsigns').preview_hunk()<CR>", 'Preview Hunk' },
			r = { "<cmd>lua require('gitsigns').reset_hunk()<CR>", 'Reset Hunk' },
			R = { "<cmd>lua require('gitsigns').reset_buffer()<CR>", 'Reset Buffer' },
		}
	},
	l = {
		name = 'LSP',
		i = { ':LspInfo<CR>', 'Info' },
		I = { '<Cmd>lua vim.lsp.buf.implementation()<CR>', 'Go to Implementation' },
		s = { '<cmd>lua vim.lsp.buf.document_symbol()<CR>', 'Document Symbol' },
		t = { '<Cmd>lua vim.lsp.buf.type_definition()<CR>', 'Go to Type-Definition' },
		f = { '<Cmd>lua vim.lsp.buf.format({ async = true })<CR>', 'Format' },
		r = { ':Telescope lsp_references<CR>', 'Show References' },
		h = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Get Signature Help' },
		d = {
			name = 'Diagnostics',
			n = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Next Diagnostic' },
			p = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Prev. Diagnostic' },
		},
	},
	t = {
		name = "Terminal",
		t = { ":ToggleTerm<CR>", 'Toggle Terminal' },
	},
	u = {
		name = 'UndoTree',
		t = { ':UndotreeToggle<CR>', 'Toggle UndoTree' },
	},
}, { mode = 'n', prefix = '<leader>', noremap = true, silent = true })

wk.register({
	u = {
		name = 'Utilities',
		l = { ':normal!$x<CR>', 'Delete last character' },
	},
}, { mode = 'v', prefix = '<leader>', noremap = true, silent = true })
