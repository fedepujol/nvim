-- Colorizer Setup

return {
	'norcalli/nvim-colorizer.lua',
	event = 'BufReadPost',
	config = function()
		require('colorizer').setup({
			'*',
			lua = { names = false },
			html = { names = false },
		})
	end
}
