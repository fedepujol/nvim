-- Nvim Tree Settings
local specialFiles = {'README.md', 'Makefile', 'MAKEFILE'}
local ignored = {'.git', 'node_modules'}

vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_disable_netrw = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_ignore = ignored
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_lsp_diagnostics = 0
vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_special_files = specialFiles
vim.g.nvim_tree_width = 30

vim.g.nvim_tree_icons = {
	default = '',
	symlink = '',
	git = {
		unstaged = "M",
		staged = "S",
		unmerged = "Um",
		renamed = "R",
		untracked = "U",
		deleted = "D",
		ignored = "I",
	},
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
		symlink_open = "",
	},
}

vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true })
