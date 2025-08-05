-- GitSigns
---@module "lazy"
---@type LazyPluginSpec
return {
	'lewis6991/gitsigns.nvim',
	event = 'BufReadPre',
	config = function()
		local gitsigns = require('gitsigns')
		gitsigns.setup({
			signs = {
				add = { text = '│' },
				change = { text = '│' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
				untracked = { text = '┆' },
			},
			numhl = true,
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = 'eol',
				delay = 2000,
			},
			current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
			preview_config = {
				border = 'rounded',
			},
		})

		vim.keymap.set(
			'n',
			'<leader>gb',
			gitsigns.toggle_current_line_blame,
			{ desc = '[g]it [b]lame' }
		)
		vim.keymap.set('n', '<leader>ghn', function()
			gitsigns.nav_hunk('next')
		end, { desc = '[g]it [h]unk [n]ext' })
		vim.keymap.set('n', '<leader>ghp', function()
			gitsigns.nav_hunk('prev')
		end, { desc = '[g]it [h]unk [p]rev' })
		vim.keymap.set(
			'n',
			'<leader>ghP',
			gitsigns.preview_hunk,
			{ desc = '[g]it [h]unk [P]review' }
		)
		vim.keymap.set('n', '<leader>grh', gitsigns.reset_hunk, { desc = '[g]it [r]eset [h]unk' })
		vim.keymap.set(
			'n',
			'<leader>grb',
			gitsigns.reset_buffer,
			{ desc = '[g]it [r]eset [b]uffer' }
		)
	end,
}
