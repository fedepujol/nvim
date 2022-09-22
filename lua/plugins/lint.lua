-- nvim-lint
local severities = {
	error = vim.diagnostic.severity.ERROR,
	warning = vim.diagnostic.severity.WARN,
	info = vim.diagnostic.severity.INFO
}

require('lint').linters.tslint = {
	cmd = 'C:\\Users\\PujolF\\Workspace\\tools\\nodejs\\tslint.cmd',
	stdin = false,
	append_name = true,
	args = {
		'-t', 'json', '-p', vim.fn.getcwd()
	},
	stream = 'both',
	ignore_exitcode = true,
	parser = function(output)
		local diagnostics = {}
		local items = #output > 0 and vim.json.decode(output) or {}

		for _, item in ipairs(items) do
			table.insert(diagnostics, {
				col = item.startPosition.character,
				lnum = item.startPosition.line,
				end_col = item.endPosition.character,
				end_lnum = item.endPosition.line,
				message = item.failure,
				severity = severities[item.ruleSeverity:lower()],
				source = 'tslint',
			})
		end
		return diagnostics
	end
}

require('lint').linters_by_ft = {
	markdown = { 'markdownlint' },
	nix = { 'nix' },
	sh = { 'shellcheck' },
	vim = { 'vint' },
	yaml = { 'yamllint' },
	typescript = { 'tslint' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
	callback = function()
		require('lint').try_lint()
	end
})
