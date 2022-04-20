require('tabout').setup({
	tabkey = '<Tab>',
	backward_tabkey = '<S-Tab>',
	act_as_tab = true, -- Act as a tab if tabout is not possible
	act_as_shift_tab = false,
	enable_backwards = true,
	completion = true,
	tabouts = {
		{ open = "'", close = "'" },
		{ open = '"', close = '"' },
		{ open = '`', close = '`' },
		{ open = '(', close = ')' },
		{ open = '[', close = ']' },
		{ open = '{', close = '}' },
	},
	ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
	exclude = {}, -- tabout will ignore these filetypes
})
