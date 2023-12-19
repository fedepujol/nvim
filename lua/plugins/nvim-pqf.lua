return {
	'yorickpeterse/nvim-pqf',
	event = 'LspAttach',
	config = function ()
		require('pqf').setup()
	end
}
