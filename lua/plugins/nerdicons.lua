return {
	'glepnir/nerdicons.nvim',
	cmd = 'NerdIcons',
	config = function ()
		require('nerdicons').setup({
			border = 'rounded',
			prompt = '>',
			preview_prompt = ' ',
		})
	end
}
