-- Nvim Tree Settings
local specialFiles = {'README.md', 'Makefile', 'MAKEFILE'}

vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_width = 40
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_disable_netrw = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_lsp_diagnostics = 0
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_special_files = specialFiles
vim.g.nvim_tree_icons = {
	default = '',
	symlink = '',
	git = {
		unstaged = "Us",
		staged = "S",
		unmerged = "Um",
		renamed = "R",
		untracked = "U",
		deleted = "D",
		ignored = "I"
	},
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
		symlink_open = "",
	},
	lsp = {
		hint = "",
		info = "",
		warning = "",
		error = "",
	}
}
