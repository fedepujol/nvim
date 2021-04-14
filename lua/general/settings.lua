-- Settings
local o = vim.o
local bo = vim.bo
local wo = vim.wo

-- Global Options
o.background = "dark"                   -- Tell NVim the background color
o.backup = false                        -- No backup file when written
o.clipboard = "unnamedplus"             -- Copy-Paste between Neovim and everything else
o.cmdheight = 2                         -- More space to display messages
o.completeopt = "menuone,noselect"      -- Necesary form nvim-compe
o.encoding = "UTF-8"                    -- Encoding used internally
o.hidden = true                         -- Buffers becomes hidden when abandoned
o.hlsearch = true                       -- Highlighting search
o.mouse = "a"                           -- Enables mouse support
o.pumheight = 10                        -- Maximum number of items to show in Pop-ups
o.ruler = true                          -- Show line and column numbers of the cursor position
o.showtabline = 2                       -- Always show tabs
o.smarttab = true                       -- Insert "tabstop" number of spaces when pressing tab 
o.splitbelow = true                     -- Horizontal splits will be bellow
o.splitright = true                     -- Vertical splits will be on the right
o.termguicolors = true                  -- Set for colorizer
o.timeoutlen = 500                      -- Time in miliseconds to wait for a mapped sequence to complete
o.updatetime = 300                      -- Time to wait before the swap file is written to disk (also CursorHold)
o.writebackup = false                   -- No backup file

-- Buffer Options
bo.autoindent = true                    -- Copy indent from current line when starting a new line
bo.expandtab = true                     -- Converts tabs into spaces
bo.fileencoding = "UTF-8"               -- Encoding fot the current buffer. Conversion done with iconv()
bo.shiftwidth = 4                       -- Change number of spaces inserted for indentation
bo.smartindent = true                   -- Smart autoindenting when starting a new line
bo.syntax = "ON"                        -- Enable syntax
bo.tabstop = 4                          -- Set 1 tab as 4 spaces

-- Window Options
wo.conceallevel = 0                     -- Determine how text with the "conceal" attribute is shown. 0 -> As text
wo.cursorline = true                    -- Enable hightlightning of the current line
wo.number = true                        -- Line numbers
wo.wrap = false                         -- Display long lines as such