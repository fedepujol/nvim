-- Nvim Tree Settings
local specialFiles = {'README.md', 'Makefile', 'MAKEFILE'}
local ignored = {'.git', 'node_modules'}

vim.g.nvim_tree_add_trailing = 1 				-- Append a trailing dash to folders
vim.g.nvim_tree_auto_close = 1 					-- Closes the tree when its the last window
vim.g.nvim_tree_auto_open = 1 					-- Open NvimTree when typing vim $DIR or vim
vim.g.nvim_tree_follow = 1 						-- Allows the cursor to be updated when entering another buffer
vim.g.nvim_tree_disable_netrw = 1 				-- Disables netrw
vim.g.nvim_tree_git_hl = 1 						-- Enable git hightlights
vim.g.nvim_tree_group_empty = 1 				-- Compact folders that only contain a single folder
vim.g.nvim_tree_hide_dotfiles = 1 				-- Hide dotfiles
vim.g.nvim_tree_ignore = ignored 				-- Tell NvimTree to ingore this
vim.g.nvim_tree_indent_markers = 1 				-- Show indent marks
vim.g.nvim_tree_lsp_diagnostics = 0 			-- Dont show LspDiagnostics info in sign column
vim.g.nvim_tree_side = 'left' 					-- Tree side
vim.g.nvim_tree_special_files = specialFiles 	-- List of elements that gets highlight with NvimTreeSpecialFile
vim.g.nvim_tree_width = 30 						-- Default Tree Width
vim.g.nvim_tree_width_allow_resize = 1 			-- Will resize the tree when opening a file

-- Redefined NvimTree icons for git information
-- and Folders
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
