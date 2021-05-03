-- Settings
local o = vim.o

-- Global Options
o.termguicolors = true 					-- Set for colorizer. Enables 24-Bit Colors on TUI.
o.completeopt = "menuone,noselect" 		-- Set for nvim-compe. Comma-separated options for Insert mode.
o.showmode = false 						-- In Insert/Replace/Visual put a message on the last line.
o.laststatus = 2 						-- Influence if the last window should have a statusline. 2 -> always.
