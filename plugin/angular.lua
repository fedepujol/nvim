vim.filetype.add({
	pattern = {
		['.*%.component%.html'] = 'htmlangular', -- Sets the filetype to `angular.html` if it matches the pattern
	},
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'htmlangular',
	callback = function()
		vim.treesitter.language.register('angular', 'htmlangular') -- Register the filetype with treesitter for the `angular` language/parser
	end,
})
