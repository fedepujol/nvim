-- WhichKey
require('which-key').setup {
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
		["<space>"] = "SPC",
		["<CR>"] = "RET",
		["<Tab>"] = "TAB",
		["<leader>"] = "LEAD"
	},
	window = {
		border = "none",
		position = "bottom",
	},
	show_help = true,
	hidden = {'<silent>', '<cmd>', '<CMD>', '<CR>', 'lua', '^:'},
}

local wk = require('which-key')

wk.register({
	['|'] = {
		name = "General Settings",
		k = {"<cmd>lua require('telescope.builtin').keymaps()<CR>", "Keymaps"},
		h = {":checkhealth<CR>", "Neovim Healt"},
	},
	g = {
		name = "Git",
		j = {"<cmd>lua require('gitsigns').next_hunk()<CR>", "Next Hunk"},
		J = {"<cmd>lua require('gitsigns').prev_hunk()<CR>", "Prev Hunk"},
		p = {"<cmd>lua require('gitsigns').preview_hunk()<CR>", "Preview Hunk"},
		b = {"<cmd>lua require('telescope.builtin').git_branches()<CR>", "Checkout Branch"},
		s = {"<cmd>lua require('telescope.builtin').git_status()<CR>", "Status"},
		c = {"<cmd>lua require('telescope.builtin').git_bcommits()<CR>", "Branch Commits"}
	},
	l = {
		name = "LSP",
		i = {":LspInfo<CR>", "Info"},
		H = {"<cmd>lua vim.lsp.buf.hover()<CR>", "Hover"},
		d = { '<Cmd>lua vim.lsp.buf.definition()<CR>', "Go To Definition"},
		I = { '<Cmd>lua vim.lsp.buf.implementation()<CR>', "Go to Implementation"},
		s = { '<cmd>lua vim.lsp.buf.document_symbol()<CR>', "Document Symbol"},
		c = { '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', "Show Code Actions"},
		t = { '<Cmd>lua vim.lsp.buf.type_definition()<CR>', "Go to Type-Definition"},
		f = { '<Cmd>lua vim.lsp.buf.formatting()<CR>', "Format"},
		r = { '<cmd>lua vim.lsp.buf.references()<CR>', "Show References"},
		h = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', "Get Signature Help"},
		n = { '<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = "single"}})<CR>', "Next Diagnostic"},
		p = { '<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = "single"}})<CR>', "Prev. Diagnostic"},
	},
	s = {
		name = "TreeSitter",
		m = {":TSModuleInfo<CR>", "Module Info"},
		i = {":TSInstallInfo<CR>", "Install Info"},
	}
}, {mode = 'n', prefix = '<leader>', noremap = true, silent = true})
