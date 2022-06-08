-- Custom Providers
local M = {}

M.colors = {
	white = '#FFFFFF',

	black0 = '#000000',
	black3 = '#161616',

	blue0 = '#0D47A1',
	blue1 = '#1565C0',

	green0 = '#247B22',
	green3 = '#36B739',
	green4 = '#69D36B',
	green5 = '#87DC89',

	gray1 = '#808080',
	gray3 = '#B1B1B1',
	gray5 = '#D8D8D8',
	gray6 = '#E2E2E2',

	red0 = '#890000',
	red2 = '#D80000',
	red3 = '#EB0000',
	red5 = '#FF1414',
	red7 = '#FF3B3B',

	yellow1 = '#9D9D00',

	purple3 = '#800080',

	orange0 = '#764C00',
	orange4 = '#FFAC14',
	orange5 = '#FFB327',
}

M.icons = {
	distros = {
		['alpine'] = { icon = '', colors = { M.colors.blue0, M.colors.white } },
		['arch'] = { icon = '', colors = { M.colors.blue1, M.colors.black3 } },
		['centos'] = { icon = '', colors = { M.colors.white, M.colors.black3 } },
		['debian'] = { icon = '', colors = { M.colors.white, M.colors.black3 } },
		['fedora'] = { icon = '', colors = { M.colors.blue0, M.colors.white } },
		['freebsd'] = { icon = '', colors = { M.colors.red2, M.colors.black3 } },
		['gentoo'] = { icon = '', colors = { M.colors.white, M.colors.black3 } },
		['linux'] = { icon = '', colors = { M.colors.white, M.colors.black3 } },
		['macos'] = { icon = '', colors = { M.colors.white, M.colors.black3 } },
		['manjaro'] = { icon = '', colors = { M.colors.green3, M.colors.black3 } },
		['mageia'] = { icon = '', colors = { M.colors.white, M.colors.black3 } },
		['mandriva'] = { icon = '', colors = { M.colors.white, M.colors.black3 } },
		['mint'] = { icon = '', colors = { M.colors.green4, M.colors.black3 } },
		['nixos'] = { icon = '', colors = { M.colors.white, M.colors.black3 } },
		['opensuse'] = { icon = '', colors = { M.colors.green5, M.colors.black3 } },
		['raspberry'] = { icon = '', colors = { M.colors.red5, M.colors.black3 } },
		['redhat'] = { icon = '', colors = { M.colors.red5, M.colors.black3 } },
		['ubuntu'] = { icon = '', colors = { M.colors.orange4, M.colors.black3 } },
		['unknown'] = { icon = '', colors = { M.colors.black3, M.colors.red0 } },
		['windows'] = { icon = '', colors = { M.colors.white, M.colors.black3 } },
	},
}

M.mode_aliases = {
	[19] = { alias = 'S-BLOCK', color = { fg = M.colors.black0, bg = M.colors.gray5 } },
	[22] = { alias = 'V-BLOCK', color = { fg = M.colors.black0, bg = M.colors.orange5 } },
	[82] = { alias = 'REPLACE', color = { fg = M.colors.white, bg = M.colors.red3 } },
	[83] = { alias = 'S-LINE', color = { fg = M.colors.black0, bg = M.colors.gray3 } },
	[86] = { alias = 'V-LINE', color = { fg = M.colors.black0, bg = M.colors.orange4 } },
	[99] = { alias = 'COMMAND', color = { fg = M.colors.white, bg = M.colors.purple3 } },
	[105] = { alias = 'INSERT', color = { fg = M.colors.white, bg = M.colors.green0 } },
	[110] = { alias = 'NORMAL', color = { fg = M.colors.white, bg = M.colors.blue0 } },
	[114] = { alias = 'OP-PENDING', color = { fg = M.colors.black0, bg = M.colors.gray6 } },
	[115] = { alias = 'SELECT', color = { fg = M.colors.black0, bg = M.colors.gray1 } },
	[116] = { alias = 'TERMINAL', color = { fg = M.colors.white, bg = M.colors.yellow1 } },
	[118] = { alias = 'VISUAL', color = { fg = M.colors.white, bg = M.colors.orange0 } },
}

M.getDistro = function(os)
	if os ~= nil then
		local di = M.icons.distros[os]
		if di == nil then
			return M.icons.distros.unknown
		else
			return di
		end
	else
		return M.icons.distros.unknown
	end
end

M.getIcon = function(os)
	return M.getDistro(os).icon
end

M.getColor = function(os)
	return M.getDistro(os).colors
end


local getCurrentMode = function()
	local cMode = M.mode_aliases[vim.fn.mode():byte()]
	if cMode == nil then
		-- If mode is not mapped, show the mode() and the byte convertion
		cMode = {
			alias = vim.fn.mode() .. ' ' .. vim.fn.mode():byte(),
			color = { fg = M.colors.white, bg = M.colors.red7 },
		}
	end
	return cMode
end

M.getModeAlias = function()
	return getCurrentMode().alias
end

M.getModeColor = function()
	return getCurrentMode().color
end

M.position = function()
	return ' ' .. string.format('%02d.%02d', unpack(vim.api.nvim_win_get_cursor(0))) .. ' '
end

-- Doesn't work with feline
M.percentage = function()
	local cL = vim.fn.line('.')
	local tL = vim.fn.line('$')

	if cL == 1 then
		return ' Top '
	elseif cL == tL then
		return ' Bot '
	end

	local result, _ = math.modf((cL / tL) * 100)

	return ' ' .. string.format('%02d', result) .. '%%'
end

M.lsp_client = function()
	local lsps = 0
	local lsp_name = ''
	for _, client in pairs(vim.lsp.buf_get_clients(0)) do
		if lsp_name == '' then
			lsp_name = client.name
		end
		lsps = lsps + 1
	end

	local res = ' (' .. string.format('%d', lsps) .. ') '
	return lsp_name == '' and res or res .. lsp_name .. ' '
end

-- Heirline
local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local ndIcons = require('nvim-web-devicons')

local Align = { provider = '%=' }
local Space = { provider = ' ' }

-- OSIcon
local os = 'freebsd'
local OSIcon = {
	provider = function()
		return ' ' .. M.getIcon(os) .. ' '
	end,
	hl = {
		fg = M.getColor(os)[1],
		bg = M.getColor(os)[2],
	},
}

-- ViMode
local ViMode = {
	provider = function()
		return ' ' .. M.getModeAlias() .. ' '
	end,
	hl = function()
		return {
			fg = M.getModeColor().fg,
			bg = M.getModeColor().bg,
		}
	end,
}

local fileNameBlock = {
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
	end,
}

local fileIcon = {
	init = function(self)
		local filename = self.filename
		local extension = vim.fn.fnamemodify(filename, ':e')
		self.icon, self.icon_color = ndIcons.get_icon_color(filename, extension, { default = true })
	end,
	provider = function(self)
		return self.icon and (self.icon .. ' ')
	end,
	hl = function(self)
		return { fg = self.icon_color }
	end,
}

local fileName = {
	provider = function(self)
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
		end,
	},
	{
		provider = function()
			if not vim.bo.modifiable or vim.bo.readonly then
				return ''
			end
		end,
	},
}

fileNameBlock = utils.insert(fileNameBlock, fileIcon, fileName, unpack(fileFlags), { provider = '%<' })

-- File Size
local fileSize = {
	provider = function()
		local i = 1
		local suffix = { 'B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB' }
		local fSize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))

		fSize = (fSize < 0 and 0) or fSize
		if fSize <= 0 then
			return '0' .. suffix[1]
		end

		while fSize >= 1024 do
			fSize = fSize / 1024
			i = i + 1
		end

		return string.format('%.2g%s', fSize, suffix[i])
	end,
}

-- Diagnostics
local Diagnostics = {
	condition = conditions.has_diagnostics,

	static = {
		error_icon = '',
		warn_icon = '',
		info_icon = 'I',
		hint_icon = 'H',
	},

	init = function(self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
		self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	end,
	{
		provider = function(self)
			return self.errors > 0 and (self.error_icon .. ' ' .. self.errors .. ' ')
		end,
		hl = { fg = utils.get_highlight('DiagnosticError').fg },
	},
	{
		provider = function(self)
			return self.warnings > 0 and (self.warn_icon .. ' ' .. self.warnings .. ' ')
		end,
		hl = { fg = utils.get_highlight('DiagnosticWarn').fg },
	},
	{
		provider = function(self)
			return self.info > 0 and (self.info_icon .. ' ' .. self.info .. ' ')
		end,
		hl = { fg = utils.get_highlight('DiagnosticInfo').fg },
	},
	{
		provider = function(self)
			return self.hints > 0 and (self.hint_icon .. ' ' .. self.hints .. ' ')
		end,
		hl = { fg = utils.get_highlight('DiagnosticHint').fg },
	},
}

-- Git
local Git = {
	condition = conditions.is_git_repo,

	init = function(self)
		self.status_dict = vim.b.gitsigns_status_dict
		self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
	end,
	{
		provider = function(self)
			return ' ' .. self.status_dict.head .. ' '
		end,
		hl = { fg = utils.get_highlight('PreProc').fg },
	},
	{
		provider = function(self)
			local count = self.status_dict.added or 0
			return count > 0 and ('+' .. count) .. ' '
		end,
		hl = { fg = utils.get_highlight('DiffAdd').fg },
	},
	{
		provider = function(self)
			local count = self.status_dict.removed or 0
			return count > 0 and ('-' .. count) .. ' '
		end,
		hl = { fg = utils.get_highlight('DiffDelete').fg },
	},
	{
		provider = function(self)
			local count = self.status_dict.changed or 0
			return count > 0 and ('~' .. count)
		end,
		hl = { fg = utils.get_highlight('DiffChange').fg },
	},
}

-- Lsp
local Lsp = {
	condition = conditions.lsp_attached,
	-- update = { 'LspAttach', 'LspDetach' },
	provider = function()
		local count = 0
		for _, _ in ipairs(vim.lsp.buf_get_clients(0)) do
			count = count + 1
		end
		return ' Lsp [' .. count .. ']'
	end,
	hl = {
		fg = utils.get_highlight('Type').fg,
	},
}

-- Cursor Position
local Ruler = {
	provider = ' %2l.%2c',
	hl = {
		fg = utils.get_highlight('Special').fg,
	},
}

local Percentage = {
	provider = function()
		local cL = vim.fn.line('.')
		local tL = vim.fn.line('$')

		if cL == 1 then
			return ' Top'
		elseif cL == tL then
			return ' Bot'
		end

		local result, _ = math.modf((cL / tL) * 100)
		local percentage = string.format('%02d', result)

		return ' ' .. percentage .. '%%'
	end,
	hl = {
		fg = utils.get_highlight('StorageClass').fg,
	},
}

-- Config
local MainLine = {
	OSIcon,
	ViMode,
	Space,
	fileNameBlock,
	Space,
	fileSize,
	Space,
	Diagnostics,
	Align,
	Git,
	Align,
	Lsp,
	Space,
	Ruler,
	Space,
	Percentage,
	Space,
}

local FileType = {
	provider = function()
		return string.upper(vim.bo.filetype)
	end,
}

local SpecialLine = {
	condition = function()
		return conditions.buffer_matches({
			buftype = { 'nofile', 'help', 'quickfix' },
			filetype = { '^git.*', 'fugitive' },
		}) or (not conditions.is_active())
	end,
	OSIcon,
	Space,
	FileType,
	Align,
	{ condition = conditions.is_active, Ruler, Space, Percentage },
}

local TerminalName = {
	provider = function()
		local tName = vim.api.nvim_buf_get_name(0)
		-- Remove Prefix
		tName = string.gsub(tName, '.*/%d+:', '')
		-- Remove Suffix
		tName = string.gsub(tName, '&.*', '')
		return ' ' .. string.sub(tName, 1, 1):upper() .. string.sub(tName, 2)
	end,
}

local TerminalLine = {
	condition = function()
		return conditions.buffer_matches({
			buftype = { 'terminal' },
		})
	end,
	OSIcon,
	Space,
	ViMode,
	Space,
	TerminalName,
	Align,
	Ruler,
	Space,
	Percentage,
	Space,
}

local StatusLines = {
	hl = function()
		if conditions.is_active() then
			return {
				fg = utils.get_highlight('StatusLine').fg,
				bg = utils.get_highlight('StatusLine').bg,
			}
		else
			return {
				fg = utils.get_highlight('StatusLineNC').fg,
				bg = utils.get_highlight('StatusLineNC').bg,
			}
		end
	end,
	init = utils.pick_child_on_condition,
	SpecialLine,
	TerminalLine,
	MainLine,
}

vim.cmd([[
	augroup heirline
		autocmd!
		autocmd ColorScheme * lua require('heirline').reset_highlights(); vim.cmd('luafile lua/plugins/ui/statusline/heirline/init.lua')
	augroup END
]])

require('heirline').setup(StatusLines)

