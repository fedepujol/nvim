---@module "lazy"
---@type LazyPluginSpec
return {
	'nvim-orgmode/orgmode',
	ft = 'org',
	dependencies = {
		'chipsenkbeil/org-roam.nvim',
		'akinsho/org-bullets.nvim',
	},
	config = function()
		require('orgmode').setup({
			org_agenda_files = vim.fn.expand('~/sid/vault/agenda'),
			org_defautl_notes_file = vim.fn.expand('~/sid/vault/refile.org'),
			org_startup_folded = 'showeverything',
			org_startup_indented = true,
			win_split_mode = 'float',
			win_border = 'rounded',
			org_capture_templates = {
				n = {
					description = 'Note',
					template = ':PROPERTIES:\n:AUTHOR:%n\n:DATE:%T\n:END:\n\n* Note Title\n',
				},
				t = {
					description = 'Task',
					template = '* TODO %?\n %u',
				},
			},

			-- Experimental LSP support
			vim.lsp.enable('org'),
		})

		require('org-roam').setup({
			directory = vim.fn.expand('~/sid/vault/notes'),
		})

		require('org-bullets').setup({})
	end,
}
