-- LspSaga Setup

local saga = require('lspsaga')
saga.init_lsp_saga {
	use_saga_diagnostic_sign = false,
	code_action_prompt = {
		enable = true,
		sign = true,
		virtual_text = true,
	},
	border_style = "single"
}

vim.api.nvim_set_keymap('n', ';f', "<cmd>lua require('lspsaga.provider').lsp_finder()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", {noremap = true, silent = true})

