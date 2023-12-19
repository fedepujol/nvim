-- Settings
-- For more information about the options use :h 'option'.
-- E.g. :h 'background'

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.background = 'dark' -- Tell NVim the background color
vim.opt.backup = false -- No backup file when written
vim.opt.clipboard = 'unnamedplus' -- Copy-Paste between Neovim and everything else
vim.opt.cmdheight = 0 -- Number of screen lines to use for messages
vim.opt.completeopt = 'menuone,noselect' -- Set for nvim-compe. Comma-separated options for insert mode.
vim.opt.conceallevel = 0 -- Determine how text with the "conceal" attribute is shown. 0 -> As text
vim.opt.cursorline = true -- Enable hightlightning of the current line
vim.opt.encoding = 'UTF-8' -- Encoding used internally
vim.opt.expandtab = false -- Converts tabs into spaces
vim.opt.fileencoding = 'UTF-8' -- Encoding fot the current buffer. Conversion done with iconv()
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.foldcolumn = '1' -- When and how to draw folding column
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.guifontwide = 'Fira Code:h11'
vim.opt.hidden = true -- Buffers becomes hidden when abandoned
vim.opt.hlsearch = false -- Highlighting search
vim.opt.laststatus = 3 -- Influence if the last window should have a statusline. 2 -> always.
vim.opt.list = true -- Always show Tabs
vim.opt.listchars = 'tab:│ ,lead:.,trail:.,extends:>,precedes:<' -- Make tabs appear as | in the editor
vim.opt.mouse = 'a' -- Enables mouse support
vim.opt.number = true -- Number line
vim.opt.pumheight = 10 -- Maximum number of items to show in Pop-ups
vim.opt.relativenumber = true -- Relative numbers line
vim.opt.ruler = true -- Show line and column numbers of the cursor position
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.shiftwidth = 4 -- Change number of spaces inserted for indentation
vim.opt.showmode = false -- In Insert/Replace/Visual put a message on the last line.
vim.opt.showtabline = 2 -- Always show tabs
vim.opt.showcmdloc = 'statusline' -- Show command on statusline
vim.opt.signcolumn = 'yes' -- Always show the SignColumn
vim.opt.smartindent = true -- Smart autoindenting when starting a new line
vim.opt.smarttab = true -- Insert "tabstop" number of spaces when pressing tab
vim.opt.softtabstop = -1 -- Length to use when editing text (0 for 'tabstop', -1 for 'shiftwidth')
vim.opt.splitbelow = true -- Horizontal splits will be bellow
vim.opt.splitright = true -- Vertical splits will be on the right
vim.opt.swapfile = false -- No SwapFile
vim.opt.syntax = 'ON' -- Enable syntax
vim.opt.tabstop = 4 -- Set tab to 4 spaces
vim.opt.termguicolors = true -- Set for colorizer. Enables 24Bit colors on TUI.
vim.opt.timeoutlen = 500 -- Time in miliseconds to wait for a mapped sequence to complete
vim.opt.undofile = true
vim.opt.undolevels = 2000
vim.opt.updatetime = 300 -- Time to wait before the swap file is written to disk (also CursorHold)
vim.opt.wrap = false -- Display long lines as such
vim.opt.writebackup = false -- No backup file

vim.cmd('filetype plugin indent on')
vim.cmd(':lang en_GB')

if vim.g.neovide then
	vim.o.guifont = "FiraCode Nerd Font:h11"
	vim.g.neovide_confirm_quit = true
	vim.g.neovide_cursor_animation_length = 0
end
