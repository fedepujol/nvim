-- Colorizer Setup

return {
	'NvChad/nvim-colorizer.lua',
	event = 'BufReadPost',
	config = function()
		require('colorizer').setup({
			'*',
			lua = { names = false },
			html = { names = false },
			cmp_docs = {
				always_update = true
			}
		})
	end
}
