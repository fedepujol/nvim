-- Heirline
local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local ndIcons = require('nvim-web-devicons')

-- Custom Providers
local viMode = require('plugins.ui.statusline.cprov.mode')
local icon = require('plugins.ui.statusline.cprov.icon')

local Align = { provider = "%=" }
local Space = { provider = " " }

-- OSIcon
local os = 'freebsd'
local OSIcon = {
	provider = function()
		return ' '..icon.getIcon(os)..' '
	end,
	hl = {
		fg = icon.getColor(os)[1],
		bg = icon.getColor(os)[2],
	}
}

-- ViMode
local ViMode = {
	provider = function()
		return ' '..viMode.getModeAlias()..' '
	end,
	hl = function()
		return {
			fg = viMode.getModeColor().fg,
			bg = viMode.getModeColor().bg,
		}
	end
}

local fileNameBlock = {
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
	end
}

local fileIcon = {
	init = function(self)
		local filename = self.filename
		local extension = vim.fn.fnamemodify(filename, ':e')
		self.icon, self.icon_color = ndIcons.get_icon_color(filename, extension, { default = true })
	end,
	provider = function(self)
		return self.icon and (self.icon .. " ")
	end,
	hl = function(self)
		return { fg = self.icon_color }
	end
}

local fileName = {
	provider = function (self)
		local filename = vim.fn.fnamemodify(self.filename, ':t')
		if filename == '' then
			return 'Undefined'
		end
		if not conditions.width_percent_below(#filename, 0.25) then
			filename = vim.fn.pathshorten(filename)
		end
		return filename
	end,
}

local fileFlags = {
	{
		provider = function()
			if vim.bo.modified then
				return '*'
			end
		end
	},
	{
		provider = function()
			if not vim.bo.modifiable or vim.bo.readonly then
				return ""
			end
		end
	}
}

fileNameBlock = utils.insert(fileNameBlock,
	fileIcon, fileName, unpack(fileFlags),
	{ provider = '%<' }
)

-- File Size
local fileSize = {
	provider = function()
		local i = 1
		local suffix = { 'B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB' }
		local fSize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))

		fSize = (fSize < 0 and 0) or fSize
		if fSize <= 0 then
			return '0'..suffix[1]
		end

		while fSize >= 1024 do
			fSize = fSize / 1024
			i = i + 1
		end

		return string.format('%.2g%s', fSize, suffix[i])
	end
}

-- Diagnostics
local Diagnostics = {
	condition = conditions.has_diagnostics,

	static = {
		error_icon = '',
		warn_icon = '',
		info_icon = 'I',
		hint_icon = 'H'
	},

	init = function(self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR } )
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN } )
		self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT } )
		self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO } )
	end,
	{
		provider = function(self)
			return self.errors > 0 and (self.error_icon ..' '.. self.errors .. ' ')
		end,
		hl = { fg = utils.get_highlight('DiagnosticError').fg }
	},
	{
		provider = function(self)
			return self.warnings > 0 and (self.warn_icon ..' '.. self.warnings.. ' ')
		end,
		hl = { fg = utils.get_highlight('DiagnosticWarn').fg }
	},
	{
		provider = function(self)
			return self.info > 0 and (self.info_icon ..' '.. self.info.. ' ')
		end,
		hl = { fg = utils.get_highlight('DiagnosticInfo').fg }
	},
	{
		provider = function(self)
			return self.hints > 0 and (self.hint_icon ..' '.. self.hints.. ' ')
		end,
		hl = { fg = utils.get_highlight('DiagnosticHint').fg }
	}
}

-- Git
local Git = {
	condition = conditions.is_git_repo,

	init = function(self)
		self.status_dict = vim.b.gitsigns_status_dict
		self.has_changes = self.status_dict.added ~= 0 or
		 	self.status_dict.removed ~= 0 or
			self.status_dict.changed ~= 0
	end,
	{
		provider = function(self)
			return " "..self.status_dict.head..' '
		end,
		hl = { fg = '#EC407A'},
	},
	{
		provider = function(self)
			local count = self.status_dict.added or 0
			return count > 0 and ('+'..count)..' '
		end,
		hl = { fg = '#00C251' }
	},
	{
		provider = function(self)
			local count = self.status_dict.removed or 0
			return count > 0 and ('-'..count)..' '
		end,
		hl = { fg = '#FF4B14' }
	},
	{
		provider = function(self)
			local count = self.status_dict.changed or 0
			return count > 0 and ('~'..count)
		end,
		hl = { fg = '#FF950A' }
	},
}

-- Lsp
local Lsp = {
	condition = conditions.lsp_attached,
	provider = function()
		local count = 0
		for _, _ in ipairs(vim.lsp.buf_get_clients(0)) do
			count = count + 1
		end
		return 'Lsp ['..count..']'
	end
}

-- Cursor Position
local Ruler = {
	provider = '%2l.%2c'
}

local Percentage = {
	provider = function()
		local cL = vim.fn.line('.')
		local tL = vim.fn.line('$')

		if cL == 1 then
			return " Top "
		elseif cL == tL then
			return " Bot "
		end

		local result, _ = math.modf((cL / tL) * 100)
		local percentage = string.format('%02d', result)

		return percentage..'%%'
	end,
}

-- Config
local MainLine = {
	OSIcon, ViMode, Space, fileNameBlock, Space, fileSize, Space, Diagnostics, Align,
	Git, Align,
	Lsp, Space, Ruler, Space, Percentage
}

local FileType = {
	provider = function()
		return string.upper(vim.bo.filetype)
	end,
}

local SpecialLine = {
	condition = function()
		return conditions.buffer_matches({
			buftype = {'nofile', 'help', 'quickfix'},
			filetype = {'^git.*', 'fugitive'},
		}) or (not conditions.is_active())
	end,
	OSIcon, Space, FileType, Align, Ruler, Space, Percentage
}

local TerminalName = {
	provider = function()
		local tName = vim.api.nvim_buf_get_name(0)
		-- Remove Prefix
		tName = string.gsub(tName, '.*/%d+:', '')
		-- Remove Suffix
		tName = string.gsub(tName, '&.*', '')
		return " "..string.sub(tName, 1, 1):upper()..string.sub(tName, 2)
	end,
}

local TerminalLine = {
	condition = function()
		return conditions.buffer_matches({
			buftype = { 'terminal' }
		})
	end,
	OSIcon, Space, ViMode, Space, TerminalName, Align, Ruler, Space, Percentage, Space
}

local StatusLines = {
	stop_at_first = true,
	SpecialLine, TerminalLine, MainLine,
}

require('heirline').setup(StatusLines)
