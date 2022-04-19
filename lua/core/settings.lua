-- Settings
-- For more information about the options use :h 'option'.
-- E.g. :h 'background'

local o = vim.o
local bo = vim.bo
local wo = vim.wo

-- Global Options
o.background = "dark" -- Tell NVim the background color
o.backup = false -- No backup file when written
o.clipboard = "unnamedplus" -- Copy-Paste between Neovim and everything else
o.cmdheight = 2 -- More space to display messages
o.completeopt = "menuone,noselect" -- Set for nvim-compe. Comma-separated options for insert mode.
o.encoding = "UTF-8" -- Encoding used internally
o.hidden = true -- Buffers becomes hidden when abandoned
o.hlsearch = false -- Highlighting search
o.laststatus = 3 -- Influence if the last window should have a statusline. 2 -> always.
o.listchars = "tab:│ ,lead:.,trail:.,extends:>,precedes:<" -- Make tabs appear as | in the editor
o.mouse = "a" -- Enables mouse support
o.pumheight = 10 -- Maximum number of items to show in Pop-ups
o.ruler = true -- Show line and column numbers of the cursor position
o.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.
o.showtabline = 2 -- Always show tabs
o.showmode = false -- In Insert/Replace/Visual put a message on the last line.
o.smarttab = true -- Insert "tabstop" number of spaces when pressing tab
o.splitbelow = true -- Horizontal splits will be bellow
o.splitright = true -- Vertical splits will be on the right
o.timeoutlen = 500 -- Time in miliseconds to wait for a mapped sequence to complete
o.termguicolors = true -- Set for colorizer. Enables 24Bit colors on TUI.
o.updatetime = 300 -- Time to wait before the swap file is written to disk (also CursorHold)
o.writebackup = false -- No backup file

-- Buffer Options
bo.autoindent = true -- Copy indent from current line when starting a new line
bo.expandtab = true -- Converts tabs into spaces
bo.fileencoding = "UTF-8" -- Encoding fot the current buffer. Conversion done with iconv()
vim.cmd('set shiftwidth=4') -- Change number of spaces inserted for indentation
bo.smartindent = true -- Smart autoindenting when starting a new line
bo.syntax = "ON" -- Enable syntax
vim.cmd('set tabstop=4') -- Set Tab to 4 spaces
bo.softtabstop = -1 -- Length to use when editing text (0 for 'tabstop', -1 for 'shiftwidth')

-- Window Options
wo.conceallevel = 0 -- Determine how text with the "conceal" attribute is shown. 0 -> As text
wo.cursorline = true -- Enable hightlightning of the current line
wo.list = true -- Always show Tabs
wo.number = true -- Line numbers
wo.signcolumn = 'yes' -- Always show the SignColumn
wo.wrap = false -- Display long lines as such

vim.cmd("filetype plugin indent on")
