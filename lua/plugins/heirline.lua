-- Custom Providers
return {
	'rebelot/heirline.nvim',
	event = 'VeryLazy',
	dependencies = {
		'kyazdani42/nvim-web-devicons',
		'lewis6991/gitsigns.nvim'
	},
	config = function()

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
				['alpine'] = { icon = '', colors = { fg = M.colors.blue0, bg = M.colors.white } },
				['arch'] = { icon = '', colors = { fg = M.colors.blue1, bg = M.colors.black3 } },
				['centos'] = { icon = '', colors = { fg = M.colors.white, bg = M.colors.black3 } },
				['debian'] = { icon = '', colors = { fg = M.colors.white, bg = M.colors.black3 } },
				['fedora'] = { icon = '', colors = { fg = M.colors.blue0, bg = M.colors.white } },
				['freebsd'] = { icon = '', colors = { fg = M.colors.red2, bg = M.colors.black3 } },
				['gentoo'] = { icon = '', colors = { fg = M.colors.white, bg = M.colors.black3 } },
				['linux'] = { icon = '', colors = { fg = M.colors.white, bg = M.colors.black3 } },
				['macos'] = { icon = '', colors = { fg = M.colors.white, bg = M.colors.black3 } },
				['manjaro'] = { icon = '', colors = { fg = M.colors.green3, bg = M.colors.black3 } },
				['mageia'] = { icon = '', colors = { fg = M.colors.white, bg = M.colors.black3 } },
				['mandriva'] = { icon = '', colors = { fg = M.colors.white, bg = M.colors.black3 } },
				['mint'] = { icon = '', colors = { fg = M.colors.green4, bg = M.colors.black3 } },
				['msdos'] = { icon = '', colors = { fg = M.colors.red0, bg = M.colors.blue0 } },
				['nixos'] = { icon = '', colors = { fg = M.colors.blue1, bg = M.colors.black0 } },
				['opensuse'] = { icon = '', colors = { fg = M.colors.green5, bg = M.colors.black3 } },
				['raspberry'] = { icon = '', colors = { fg = M.colors.red5, bg = M.colors.black3 } },
				['redhat'] = { icon = '', colors = { fg = M.colors.red5, bg = M.colors.black3 } },
				['ubuntu'] = { icon = '', colors = { fg = M.colors.orange4, bg = M.colors.black3 } },
				['unknown'] = { icon = '', colors = { fg = M.colors.black3, bg = M.colors.red0 } },
				['windows'] = { icon = '', colors = { fg = M.colors.white, bg = M.colors.black3 } },
			},
		}

		M.mode_aliases = {
			[19] = { alias = 'SBK', color = { fg = M.colors.black0, bg = M.colors.gray5 } },
			[22] = { alias = 'VBK', color = { fg = M.colors.black0, bg = M.colors.orange5 } },
			[82] = { alias = 'RPL', color = { fg = M.colors.white, bg = M.colors.red3 } },
			[83] = { alias = 'SLN', color = { fg = M.colors.black0, bg = M.colors.gray3 } },
			[86] = { alias = 'VLN', color = { fg = M.colors.black0, bg = M.colors.orange4 } },
			[99] = { alias = 'CMD', color = { fg = M.colors.white, bg = M.colors.purple3 } },
			[105] = { alias = 'INS', color = { fg = M.colors.white, bg = M.colors.green0 } },
			[110] = { alias = 'NML', color = { fg = M.colors.white, bg = M.colors.blue1 } },
			[114] = { alias = 'OPP', color = { fg = M.colors.black0, bg = M.colors.gray6 } },
			[115] = { alias = 'SCT', color = { fg = M.colors.black0, bg = M.colors.gray1 } },
			[116] = { alias = 'TRM', color = { fg = M.colors.black0, bg = M.colors.yellow1 } },
			[118] = { alias = 'VSL', color = { fg = M.colors.white, bg = M.colors.orange0 } },
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

		-- Heirline
		local conditions = require('heirline.conditions')
		local utils = require('heirline.utils')
		local ndIcons = require('nvim-web-devicons')

		local Align = { provider = '%=' }
		local Space = { provider = ' ' }

		-- OSIcon
		local os = 'nixos'

		-- ViMode
		local ViMode = {
			provider = function()
				return M.getIcon(os) .. ' ' .. M.getModeAlias()
			end,
			hl = function()
				return {
					fg = M.getModeColor().bg,
					bg = M.colors.black3,
				}
			end,
			update = { 'ModeChanged' },
		}

		ViMode = utils.surround({ '', '' }, M.colors.black3, { ViMode })

		local FileNameBlock = {
			init = function(self)
				self.filename = vim.api.nvim_buf_get_name(0)
			end,
		}

		local FileIcon = {
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

		local FileName = {
			provider = function(self)
				local filename = vim.fn.fnamemodify(self.filename, ':.')
				if filename == '' then
					return 'Undefined'
				end

				if not conditions.width_percent_below(#filename, 0.25) then
					return vim.fn.pathshorten(filename)
				end
				return filename
			end,
		}

		local FileFlags = {
			{
				provider = function()
					if vim.bo.modified then
						return ' ●'
					end
				end,
			},
			{
				provider = function()
					if not vim.bo.modifiable or vim.bo.readonly then
						return ' '
					end
				end,
			},
		}

		FileNameBlock =
		utils.insert(FileNameBlock, FileIcon, FileName, unpack(FileFlags), { provider = '%<' })

		-- Git
		local Git = {
			condition = conditions.is_git_repo,

			init = function(self)
				self.status_dict = vim.b.gitsigns_status_dict
				self.has_changes = self.status_dict.added ~= 0
					or self.status_dict.removed ~= 0
					or self.status_dict.changed ~= 0
			end,
			{ flexible = 2, {
				provider = function(self)
					return ' ' .. self.status_dict.head .. ' '
				end,
				hl = { fg = utils.get_highlight('PreProc').fg },
			}, {
				provider = function()
					return ' '
				end,
				hl = { fg = utils.get_highlight('PreProc').fg },
			} },
			{ flexible = 2, {
				provider = function(self)
					local count = self.status_dict.added or 0
					return count > 0 and (' ' .. count) .. ' '
				end,
				hl = { fg = utils.get_highlight('GitSignsAdd').fg },
			}, {
				provider = function(self)
					local count = self.status_dict.added or 0
					return count > 0 and '● '
				end,
				hl = { fg = utils.get_highlight('GitSignsAdd').fg },
			} },
			{ flexible = 2, {
				provider = function(self)
					local count = self.status_dict.removed or 0
					return count > 0 and (' ' .. count) .. ' '
				end,
				hl = { fg = utils.get_highlight('GitSignsChange').fg },
			}, {
				provider = function(self)
					local count = self.status_dict.removed or 0
					return count > 0 and '● '
				end,
				hl = { fg = utils.get_highlight('GitSignsChange').fg },
			} },
			{ flexible = 2, {
				provider = function(self)
					local count = self.status_dict.changed or 0
					return count > 0 and (' ' .. count)
				end,
				hl = { fg = utils.get_highlight('GitSignsDelete').fg },
			}, {
				provider = function(self)
					local count = self.status_dict.changed or 0
					return count > 0 and '●'
				end,
				hl = { fg = utils.get_highlight('GitSignsDelete').fg },
			} },
		}

		local GitBlock = utils.insert(Git, { provider = '%<' })

		-- Lsp
		local LSPBlock = {
			init = function(self)
				self.prefix = ' '
			end,
		}

		local Lsp = {
			condition = conditions.lsp_attached,
			update = { 'LspAttach', 'LspDetach' },
			provider = function(self)
				local names = {}
				for _, server in ipairs(vim.lsp.get_active_clients({bufnr = 0})) do
					table.insert(names, server.name)
				end
				return self.prefix .. '[' .. table.concat(names, ' ') .. ']'
			end,
			hl = {
				fg = utils.get_highlight('Type').fg,
			},
		}

		-- Diagnostics
		local Diagnostics = {
			condition = conditions.has_diagnostics,

			static = {
				error_icon = '',
				warn_icon = '',
				info_icon = '',
				hint_icon = '',
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

		LSPBlock = utils.insert(LSPBlock, Lsp, Space, Diagnostics, { provider = '%<' })

		-- FileEncodig
		local FileEncoding = {
			provider = function()
				local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc
				return enc:upper()
			end,
			hl = { fg = utils.get_highlight('Number').fg }
		}

		local FileFormat = {
			provider = function()
				local res = ''
				local fmt = vim.bo.fileformat
				if fmt == 'unix' then
					res = M.getIcon('linux') .. ' ' .. fmt:upper()
				elseif fmt == 'dos' then
					res = M.getIcon('msdos') .. ' ' .. fmt:upper()
				else
					res = M.getIcon('macos') .. ' ' .. fmt:upper()
				end
				return res
			end,
			hl = { fg = utils.get_highlight('Character').fg }
		}

		-- File Size
		local FileSize = {
			condition = function()
				return vim.api.nvim_buf_get_name(0) ~= ''
			end,
			provider = function()
				local i = 1
				local suffix = { 'b', 'Kb', 'Mb', 'Gb', 'Tb', 'Pb', 'Eb' }
				local fSize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))

				fSize = (fSize < 0 and 0) or fSize
				while fSize >= 1024 do
					fSize = fSize / 1024
					i = i + 1
				end

				return string.format('%.2g%s猪', fSize, suffix[i])
			end,
		}

		local FileType = {
			provider = function()
				return string.upper(vim.bo.filetype)
			end,
		}

		-- Cursor Position
		local Ruler = {
			provider = ' %2l:%2c',
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

		-- Config
		local MainLine = {
			ViMode,
			Space,
			FileNameBlock,
			Space,
			FileSize,
			Align,
			GitBlock,
			Align,
			LSPBlock,
			Space,
			FileFormat,
			Space,
			FileEncoding,
			Space,
			Ruler,
			Space,
			Percentage,
			Space,
		}

		local SpecialLine = {
			condition = function()
				return conditions.buffer_matches({
					buftype = { 'nofile', 'help', 'quickfix' },
					filetype = { '^git.*', 'fugitive' },
				}) or (not conditions.is_active())
			end,
			ViMode,
			Space,
			FileType,
			Align,
			{ condition = conditions.is_active, Ruler, Space, Percentage },
		}

		local TerminalLine = {
			condition = function()
				return conditions.buffer_matches({
					buftype = { 'terminal' },
				})
			end,
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
			fallthrough = false,
			SpecialLine,
			TerminalLine,
			MainLine,
		}

		vim.api.nvim_create_augroup('Heirline', { clear = true })
		vim.api.nvim_create_autocmd('ColorScheme', {
			callback = function()
				require('heirline').reset_highlights()
			end,
		})

		require('heirline').setup({
			statusline = StatusLines,
		})
	end
}
