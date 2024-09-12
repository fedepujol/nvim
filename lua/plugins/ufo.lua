return {
	'kevinhwang91/nvim-ufo',
	event = 'LspAttach',
	dependencies = {
		'kevinhwang91/promise-async',
		{
			'luukvbaal/statuscol.nvim',
			config = function()
				local builtin = require('statuscol.builtin')
				require('statuscol').setup({
					reculright = true,
					segments = {
						{ text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
						{ text = { '%s' }, click = 'v:lua.ScSa' },
						{ text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
					},
				})
			end,
		},
	},
	config = function()
		require('ufo').setup({
			provider_selector = function()
				return { 'treesitter', 'indent' }
			end,
		})
	end,
}
