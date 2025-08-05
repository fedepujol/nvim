---@module "lazy"
---@type LazyPluginSpec
return {
	'mfussenegger/nvim-lint',
	event = {
		'BufWritePost',
	},
	config = function()
		require('lint').linters_by_ft = {
			gitcommit = { 'commitlint' },
			markdown = { 'proselint' },
			sh = { 'shellcheck' },
			yaml = { 'yamllint' },
		}

		vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
			callback = function()
				require('lint').try_lint()
			end,
		})
	end,
}
