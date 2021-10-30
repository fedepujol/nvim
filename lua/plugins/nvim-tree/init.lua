-- Nvim Tree Settings
vim.g.nvim_tree_git_hl = 1 						-- Enable git hightlights
vim.g.nvim_tree_group_empty = 1 				-- Compact folders that only contain a single folder
vim.g.nvim_tree_indent_markers = 1 				-- Show indent marks
vim.g.nvim_tree_special_files = { 				-- List of elements that gets highlight with NvimTreeSpecialFile
	["Cargo.toml"] = true,
	["Makefile"] = true,
	["README.md"] = true,
	["readme.md"] = true
}
vim.g.nvim_tree_disable_window_picker = 1		-- Disable the window picker
vim.g.nvim_tree_create_in_closed_folder = 1		-- Create a file on a closed folder when the cursor is over it

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
	update_to_buf_dir = { 		-- Hijacks new directory buffers when they are opened
		enable = true,
		auto_open = true
	},
	update_focused_file = { 	-- Update the focused file on 'BufEnter', un-collapses the folder recursively until it finds the file
		enable = true, 			-- Allow the cursor to be updated when entering another buffer
		update_cwd = false,
		ignore_list = { 'node_modules', '.vscode' }
	},
	system_open = {
		cmd = nil,
		args = {}
	},
	view = {
		hide_root_folder = false, 	-- Hide path of current directory
		width = 30,					-- Default width of the tree (only works with view.side = left|right)
		height = 30,				-- Default height of the tree (only works with view.side = top|bottom)
		side = 'left', 				-- Default side of the tree (could be left|right|bottom|top)
		auto_resize = true, 		-- Resize the tree when open a file (it never works)
	},
	filters = {
		custom = { '.git', 'node_modules', '.vscode', '.gitignore' }, 	-- Tell NvimTree to ingore this
		dotfiles = false, 												-- Hide dotfiles
	}
}

vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true })
