require('neo-tree').setup({
	close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
	close_floats_on_escape_key = true,
	default_source = "filesystem",
	enable_diagnostics = false,
	enable_git_status = true,
	git_status_async = true,
	log_level = "info", -- "trace", "debug", "info", "warn", "error", "fatal"
	log_to_file = false, -- true, false, "/path/to/file.log", use :NeoTreeLogs to show the file
	open_files_in_last_window = true, -- false = open files in top left window
	popup_border_style = "rounded", -- "double", "none", "rounded", "shadow", "single" or "solid"
	resize_timer_interval = 50, -- in ms, needed for containers to redraw right aligned and faded content
	sort_case_insensitive = false, -- used when sorting files and directories in the tree
	use_popups_for_input = true, -- If false, inputs will use vim.ui.input() instead of custom floats.
	default_component_configs = {
		indent = {
			indent_size = 2,
			padding = 1,
			-- indent guides
			with_markers = true,
			indent_marker = "│",
			last_indent_marker = "└",
			highlight = "NeoTreeIndentMarker",
			-- expander config, needed for nesting files
			with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "",
			default = "",
		},
		modified = {
			symbol = "",
			highlight = "NeoTreeModified",
		},
		name = {
			trailing_slash = false,
			use_git_status_colors = true,
		},
		git_status = {
			symbols = {
				-- Change type
				added     = "", -- NOTE: you can set any of these to an empty string to not show them
				deleted   = "D",
				modified  = "",
				renamed   = "R",
				-- Status type
				untracked = "U",
				ignored   = "I",
				unstaged  = "",
				staged    = "S",
				conflict  = "",
			},
			align = "right",
		},
	},
	nesting_rules = {
		["ts"] = { "spec.ts" },
		["component.html"] = { "component.css", "component.ts" },
		["component.ts"] = { "component.spec.ts" },
	},
	window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
		position = "left", -- left, right, float, current
		width = 40, -- applies to left and right positions
		popup = { -- settings that apply to float position only
			size = {
				height = "80%",
				width = "50%",
			},
			position = "50%", -- 50% means center it
		},
		-- Mappings for tree window. See `:h nep-tree-mappings` for a list of built-in commands.
		-- You can also create your own commands by providing a function instead of a string.
		mappings = {
			["<tab>"] = "toggle_node",
			["<2-LeftMouse>"] = "open",
			["<space>"] = "open",
			["S"] = "open_split",
			["s"] = "open_vsplit",
			["t"] = "open_tabnew",
			["C"] = "close_node",
			["z"] = "close_all_nodes",
			["R"] = "refresh",
			["a"] = "add",
			["A"] = "add_directory",
			["d"] = "delete",
			["r"] = "rename",
			["y"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",
			["c"] = "copy", -- takes text input for destination
			["m"] = "move", -- takes text input for destination
			["q"] = "close_window",
		},
	},
	filesystem = {
		renderers = {
			directory = {
				{ "indent" },
				{ "icon" },
				{ "current_filter" },
				{
					"container",
					width = "100%",
					right_padding = 1,
					content = {
						{ "name", zindex = 10 },
						{ "diagnostics", errors_only = true, zindex = 20, align = "right" },
					},
				},
			},
			file = {
				{ "indent" },
				{ "icon" },
				{
					"container",
					width = "100%",
					right_padding = 1,
					content = {
						{
							"name",
							use_git_status_colors = true,
							zindex = 10
						},
						{ "git_status", zindex = 20, align = "right" },
					},
				},
			},
		},
		window = {
			mappings = {
				["H"] = "toggle_hidden",
				["/"] = "fuzzy_finder",
				["f"] = "filter_on_submit",
				["<C-x>"] = "clear_filter",
				["<bs>"] = "navigate_up",
				["."] = "set_root",
			}
		},
		bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
		filtered_items = {
			visible = false, -- when true, they will just be displayed differently than normal items
			hide_dotfiles = true,
			hide_gitignored = true,
			hide_by_name = {
				".DS_Store",
				"thumbs.db",
				"node_modules"
			},
			never_show = { -- remains hidden even if visible is toggled to true
			},
		},
		find_by_full_path_words = false, -- `false` means it only searches the tail of a path.
		search_limit = 50, -- max number of search results when using filters
		follow_current_file = false, -- This will find and focus the file in the active buffer every time
		hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
		use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
	},
	buffers = {
		bind_to_cwd = true,
		window = {
			mappings = {
				["<bs>"] = "navigate_up",
				["."] = "set_root",
				["bd"] = "buffer_delete",
			},
		},
	},
	git_status = {
		window = {
			mappings = {
				["A"] = "git_add_all",
				["gu"] = "git_unstage_file",
				["ga"] = "git_add_file",
				["gr"] = "git_revert_file",
				["gc"] = "git_commit",
				["gp"] = "git_push",
				["gg"] = "git_commit_and_push",
			},
		},
	},
})

vim.api.nvim_set_keymap('n', '<C-b>', ':NeoTreeShow<CR>', { noremap = true })
