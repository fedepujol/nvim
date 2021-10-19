-- Comment

require('Comment').setup({
	padding = true, 		-- Add a space b/w comment the line
	sticky = true,			-- Whether the cursor should stay at its position
	ignore = '^$',			-- Line to be ignore while comment/uncomment (Could be a function/regex)
})
