-- Nvim Tree Settings
local specialFiles = {'README.md', 'Makefile', 'MAKEFILE'}
local ignored = {'.git', 'node_modules'}

vim.g.nvim_tree_git_hl = 1 						-- Enable git hightlights
vim.g.nvim_tree_group_empty = 1 				-- Compact folders that only contain a single folder
vim.g.nvim_tree_hide_dotfiles = 0 				-- Hide dotfiles
vim.g.nvim_tree_ignore = ignored 				-- Tell NvimTree to ingore this
vim.g.nvim_tree_indent_markers = 1 				-- Show indent marks
vim.g.nvim_tree_special_files = specialFiles 	-- List of elements that gets highlight with NvimTreeSpecialFile
vim.g.nvim_tree_disable_window_picker = 1		-- Disable the window picker

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
		arrow_open = "",
		arrow_close = "",
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
		symlink_open = "",
	},
}

require('nvim-tree').setup {
	disable_netrw = true, 		-- Disables NetRW completely
	hijack_netrw = true, 		-- Hijack NetRW window on startup
	open_on_setup = false, 		-- Dont open the tree when running this function
	ignore_fg_on_setup = {}, 	-- Not open on setup if the filetype is in the list
	auto_close = true, 			-- Close Neovim when the tree is the last window
	open_on_tab = false, 		-- Open the tree when changing/opening a new tab
	hijack_cursor = false,		-- Hijack the cursor to put it at the start of the filename
	update_cwd = true, 			-- Updates the tree on :DirChanged
	diagnostics = {
		enable = false,
	},
	update_focused_file = { 	-- Update the focused file on 'BufEnter', un-collapses the folder recursively until it finds the file
		enable = true, 			-- Allow the cursor to be updated when entering another buffer
		update_cwd = false,
		ignore_list = {}
	},
	system_open = {
		cmd = nil,
		args = {}
	},
	view = {
		width = 30,				-- Default width of the tree
		side = 'left', 			-- Default side of the tree
		auto_resize = true, 	-- Resize the tree when open a file
	}
}

vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true })
