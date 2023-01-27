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
	['|'] = {
		name = 'General Settings',
		k = { "<cmd>lua require('telescope.builtin').keymaps()<CR>", 'Show Keymaps' },
		c = { ':checkhealth which_key<CR>', 'Search Conflicting Keymaps' },
		h = { ':checkhealth<CR>', 'Neovim Health' },
		v = { ':Telescope vim_options<CR>', 'Vim Options' },
		o = { ':CmpStatus<CR>', 'Completion Status' },
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
		s = {
			name = 'Sort',
			b = { ':BufferOrderByBufferNumber<CR>', 'Buffer Number' },
			d = { ':BufferOrderByDirectory<CR>', 'Directory' },
			l = { ':BufferOrderByLanguage<CR>', 'Language' },
			w = { ':BufferOrderByWindowNumber<CR>', 'Window Number' },
		},
		p = { ':BufferPick<CR>', 'Pick' },
	},
	u = {
		name = 'Utilities',
		d = { ':normal!$x<CR>', 'Delete last character' },
		a = { ':normal!gg0vG$<CR>', 'Select all' },
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
			s = { "<cmd>lua require('gitsigns').stage_hunk()<CR>", 'Stage Hunk' },
			S = { "<cmd>lua require('gitsigns').stage_buffer()<CR>", 'Stage Buffer' },
		},
		c = {
			name = 'Checkout',
			b = { "<cmd>lua require('telescope.builtin').git_branches()<CR>", 'Checkout Branch' },
			c = { "<cmd>lua require('telescope.builtin').git_bcommits()<CR>", 'Checkout Commits' },
		},
		s = { "<cmd>lua require('telescope.builtin').git_status()<CR>", 'Status' },
	},
	l = {
		name = 'LSP',
		i = { ':LspInfo<CR>', 'Info' },
		H = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Hover' },
		I = { '<Cmd>lua vim.lsp.buf.implementation()<CR>', 'Go to Implementation' },
		s = { '<cmd>lua vim.lsp.buf.document_symbol()<CR>', 'Document Symbol' },
		c = { ':CodeActionMenu<CR>', 'Show Code Actions' },
		t = { '<Cmd>lua vim.lsp.buf.type_definition()<CR>', 'Go to Type-Definition' },
		f = { '<Cmd>lua vim.lsp.buf.format({ async = true })<CR>', 'Format' },
		r = { ':Telescope lsp_references<CR>', 'Show References' },
		h = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Get Signature Help' },
		d = {
			name = 'Diagnostics',
			n = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Next Diagnostic' },
			p = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Prev. Diagnostic' },
		},
		p = { ':Lspsaga preview_definition<CR>', 'Preview Definition' },
	},
	m = {
		name = 'Mason',
		i = { ':Mason<CR>', 'Mason Info' },
	},
	p = {
		name = 'Lazy Plugin Manager',
		i = { ':Lazy<CR>', 'Lazy Info' }
	},
	r = {
		name = 'Run commands',
		l = { ':luafile %<CR>', 'Run luafile' },
	},
	s = {
		name = 'TreeSitter',
		m = { ':TSModuleInfo<CR>', 'Module Info' },
		i = { ':TSInstallInfo<CR>', 'Install Info' },
	},
}, { mode = 'n', prefix = '<leader>', noremap = true, silent = true })

wk.register({
	r = {
		name = 'Run',
		l = { ':luafile %<CR>', 'Run Luafile' },
	},
	u = {
		name = 'Utilities',
		l = { ':normal!$x<CR>', 'Delete last character' },
		e = { '<cmd>:lua RemoveEmptyLines()<CR>', 'Remove Emtpy Lines' },
	},
}, { mode = 'v', prefix = '<leader>', noremap = true, silent = true })
