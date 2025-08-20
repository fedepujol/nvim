vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'norg',
	callback = function()
		vim.keymap.set(
			'n',
			'<leader>nmi',
			'<CMD>Neorg inject-metadata<CR>',
			{ desc = '[n]eorg [m]etadata [i]nject' }
		)
		vim.keymap.set(
			'n',
			'<leader>nmu',
			'<CMD>Neorg update-metadata<CR>',
			{ desc = '[n]eorg [m]etadata [u]pdate' }
		)
		vim.keymap.set(
			'n',
			'<leader>nsbf',
			'<plug>(neorg.telescope.backlinks.file_backlinks)',
			{ desc = '[n]eorg [s]earch [b]acklinks [f]ile' }
		)
		vim.keymap.set(
			'n',
			'<leader>nsl',
			'<plug>(neorg.telescope.find_linkable)',
			{ desc = '[n]eorg [s]earch [l]inkables' }
		)
		vim.keymap.set(
			'n',
			'<leader>nifl',
			'<plug>(neorg.telescope.insert_file_link)',
			{ desc = '[n]eorg [i]nsert [f]ile [l]inkable' }
		)
		vim.keymap.set(
			'n',
			'<leader>nil',
			'<plug>(neorg.telescope.insert_link)',
			{ desc = '[n]eorg [i]nsert [l]inkable' }
		)
		vim.keymap.set('n', '<<', '<plug>(neorg.promo.demote.nested)', { desc = '[n]eorg demote' })
		vim.keymap.set(
			'n',
			'>>',
			'<plug>(neorg.promo.promote.nested)',
			{ desc = '[n]eorg promote' }
		)
	end,
})
