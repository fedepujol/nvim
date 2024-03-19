-- Tabout config

return {
	'abecodes/tabout.nvim',
	event = 'InsertEnter',
	config = function()
		require('tabout').setup({
			tabkey = '<Tab>',
			backward_tabkey = '<S-Tab>',
			act_as_tab = true, -- Act as a tab if tabout is not possible
			act_as_shift_tab = true,
			enable_backwards = true,
			completion = false,
			tabouts = {
				{ open = "'", close = "'" },
				{ open = '"', close = '"' },
				{ open = '`', close = '`' },
				{ open = '(', close = ')' },
				{ open = '[', close = ']' },
				{ open = '{', close = '}' },
			},
			ignore_beginning = false, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
			exclude = {}, -- tabout will ignore these filetypes
		})
	end
}
