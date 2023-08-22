return {
	'mfussenegger/nvim-lint',
	event = 'BufReadPost',
	config = function()
		require('lint').linters_by_ft = {
			markdown = { 'markdownlint' },
			sh = { 'shellcheck' },
			typescript = { 'eslint'},
			yaml = { 'yamllint' },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require('lint').try_lint()
			end
		})
	end,
}
