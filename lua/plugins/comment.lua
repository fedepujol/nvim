-- Comment

return {
	'numToStr/Comment.nvim',
	event = 'BufEnter',
	config = function ()
		require('Comment').setup({
			padding = true, -- Add a space b/w comment the line
			sticky = true, -- Whether the cursor should stay at its position
			ignore = '^$', -- Line to be ignore while comment/uncomment (Could be a function/regex)
			toggler = { -- LHS of toggling mappings (NORMAL + VISUAL mode)
				line = 'gcc', -- Line comment keymap
				block = 'gbc', -- Block comment keymap
			},
			opleader = { -- LHS of operator-pending mappings
				line = 'gc',
				block = 'gb',
			},
			mappings = {
				basic = true, -- gcc, gcb, gc[count]{motion}, gb[count]{motion}
				extra = true, -- gco, gcO, gcA
			},
		})
	end
}
