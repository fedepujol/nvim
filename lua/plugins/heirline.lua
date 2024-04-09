-- Custom Providers
return {
	'rebelot/heirline.nvim',
	event = 'VeryLazy',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'lewis6991/gitsigns.nvim',
	},
	config = function()
		local M = {}

		local white = '#FFFFFF'
		local black0 = '#000000'
		local black3 = '#161616'
		local blue1 = '#1565C0'
		local green0 = '#247B22'
		local gray1 = '#808080'
		local gray3 = '#B1B1B1'
		local gray5 = '#D8D8D8'
		local gray6 = '#E2E2E2'
		local red3 = '#EB0000'
		local red7 = '#FF3B3B'
		local yellow1 = '#9D9D00'
		local purple3 = '#800080'
		local orange0 = '#764C00'
		local orange4 = '#FFAC14'
		local orange5 = '#FFB327'

		M.mode_aliases = {
			[19] = { alias = 'SBK', color = { fg = black0, bg = gray5 } },
			[22] = { alias = 'VBK', color = { fg = black0, bg = orange5 } },
			[82] = { alias = 'RPL', color = { fg = white, bg = red3 } },
			[83] = { alias = 'SLN', color = { fg = black0, bg = gray3 } },
			[86] = { alias = 'VLN', color = { fg = black0, bg = orange4 } },
			[99] = { alias = 'CMD', color = { fg = white, bg = purple3 } },
			[105] = { alias = 'INS', color = { fg = white, bg = green0 } },
			[110] = { alias = 'NML', color = { fg = white, bg = blue1 } },
			[114] = { alias = 'OPP', color = { fg = black0, bg = gray6 } },
			[115] = { alias = 'SCT', color = { fg = black0, bg = gray1 } },
			[116] = { alias = 'TRM', color = { fg = black0, bg = yellow1 } },
			[118] = { alias = 'VSL', color = { fg = white, bg = orange0 } },
		}

		local getCurrentMode = function()
			local cMode = M.mode_aliases[vim.fn.mode():byte()]
			if cMode == nil then
				-- If mode is not mapped, show the mode() and the byte convertion
				cMode = {
					alias = vim.fn.mode() .. ' ' .. vim.fn.mode():byte(),
					color = { fg = white, bg = red7 },
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

		-- ViMode
		local ViMode = {
			provider = function()
				return ' ' .. M.getModeAlias()
			end,
			hl = function()
				return {
					fg = M.getModeColor().bg,
					bg = black3,
				}
			end,
			update = { 'ModeChanged' },
		}

		local MacroRec = {
			condition = function()
				return vim.fn.reg_recording() ~= '' and vim.o.cmdheight == 0
			end,
			provider = ' ',
			hl = { fg = 'orange', bold = true },
			utils.surround({ '[', ']' }, nil, {
				provider = function()
					return vim.fn.reg_recording()
				end,
				hl = { fg = 'green', bold = true },
			}),
			update = {
				'RecordingEnter',
				'RecordingLeave',
			},
		}

		ViMode = utils.surround({ '', '' }, black3, { MacroRec, ViMode })

		local FileIcon = {
			provider = function()
				local filename = vim.api.nvim_buf_get_name(0)
				local extension = vim.fn.fnamemodify(filename, ':e')
				local icon, _ = ndIcons.get_icon_color(filename, extension, { default = true })
				return icon
			end,
			hl = function()
				local filename = vim.api.nvim_buf_get_name(0)
				local extension = vim.fn.fnamemodify(filename, ':e')
				local _, icon_color =
					ndIcons.get_icon_color(filename, extension, { default = true })
				return { fg = icon_color }
			end,
		}

		-- Lazy
		local Lazy = {
			condition = function()
				local ok, lazy_status = pcall(require, 'lazy.status')
				return ok and lazy_status.has_updates()
			end,
			update = { 'User', pattern = 'LazyUpdate' },
			provider = function()
				return 'Updates: ' .. require('lazy.status').updates()
			end,
		}

		-- Git
		local Git = {
			condition = conditions.is_git_repo,
			init = function(self)
				self.status_dict = vim.b.gitsigns_status_dict
				self.has_changes = self.status_dict.added ~= 0
					or self.status_dict.removed ~= 0
					or self.status_dict.changed ~= 0
			end,
			{
				flexible = 2,
				{
					provider = function(self)
						return ' ' .. self.status_dict.head .. ' '
					end,
					hl = { fg = utils.get_highlight('PreProc').fg },
				},
				{
					provider = function()
						return ' '
					end,
					hl = { fg = utils.get_highlight('PreProc').fg },
				},
			},
			{
				flexible = 2,
				{
					provider = function(self)
						local count = self.status_dict.added or 0
						return count > 0 and (' ' .. count) .. ' '
					end,
					hl = { fg = utils.get_highlight('GitSignsAdd').fg },
				},
				{
					provider = function(self)
						local count = self.status_dict.added or 0
						return count > 0 and '● '
					end,
					hl = { fg = utils.get_highlight('GitSignsAdd').fg },
				},
			},
			{
				flexible = 2,
				{
					provider = function(self)
						local count = self.status_dict.removed or 0
						return count > 0 and (' ' .. count) .. ' '
					end,
					hl = { fg = utils.get_highlight('GitSignsChange').fg },
				},
				{
					provider = function(self)
						local count = self.status_dict.removed or 0
						return count > 0 and '● '
					end,
					hl = { fg = utils.get_highlight('GitSignsChange').fg },
				},
			},
			{
				flexible = 2,
				{
					provider = function(self)
						local count = self.status_dict.changed or 0
						return count > 0 and ('󰍶 ' .. count)
					end,
					hl = { fg = utils.get_highlight('GitSignsDelete').fg },
				},
				{
					provider = function(self)
						local count = self.status_dict.changed or 0
						return count > 0 and '● '
					end,
					hl = { fg = utils.get_highlight('GitSignsDelete').fg },
				},
			},
		}

		local GitBlock = utils.insert(Git, { provider = '%<' })

		-- Lsp
		local LSPBlock = {}

		local Lsp = {
			condition = conditions.lsp_attached,
			update = { 'LspAttach', 'LspDetach' },
			provider = function()
				local names = {}
				for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
					table.insert(names, server.name)
				end
				return ' [' .. table.concat(names, ' ') .. ']'
			end,
			hl = {
				fg = utils.get_highlight('Type').fg,
			},
		}

		-- Diagnostics
		local Diagnostics = {
			condition = conditions.has_diagnostics,
			static = {
				error_icon = ' ',
				warn_icon = ' ',
				info_icon = ' ',
				hint_icon = '󰌵 ',
			},
			init = function(self)
				self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
				self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
				self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
				self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
			end,
			{
				provider = function(self)
					return self.errors > 0 and (self.error_icon .. self.errors .. ' ')
				end,
				hl = { fg = utils.get_highlight('DiagnosticError').fg },
			},
			{
				provider = function(self)
					return self.warnings > 0 and (self.warn_icon .. self.warnings .. ' ')
				end,
				hl = { fg = utils.get_highlight('DiagnosticWarn').fg },
			},
			{
				provider = function(self)
					return self.info > 0 and (self.info_icon .. self.info .. ' ')
				end,
				hl = { fg = utils.get_highlight('DiagnosticInfo').fg },
			},
			{
				provider = function(self)
					return self.hints > 0 and (self.hint_icon .. self.hints .. ' ')
				end,
				hl = { fg = utils.get_highlight('DiagnosticHint').fg },
			},
		}

		LSPBlock = utils.insert(LSPBlock, Lsp, Space, Diagnostics, { provider = '%<' })

		local FileIndent = {
			provider = function()
				local res = ''
				if not vim.bo.expandtab then
					res = 'TAB: ' .. vim.bo.shiftwidth
				else
					res = 'SPC: ' .. vim.bo.shiftwidth
				end
				return res
			end,
			hl = { fg = utils.get_highlight('Boolean').fg },
		}

		-- FileEncodig
		local FileEncoding = {
			provider = function()
				local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc
				return enc:upper()
			end,
			hl = { fg = utils.get_highlight('Number').fg },
		}

		local FileFormat = {
			provider = function()
				local res = ''
				local fmt = vim.bo.fileformat
				if fmt == 'unix' then
					res = ' '
				elseif fmt == 'dos' then
					res = ' '
				else
					res = ' '
				end
				return res
			end,
			hl = { fg = utils.get_highlight('Number').fg },
		}

		local FileType = {
			provider = function()
				return vim.bo.filetype:upper()
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
					return '󰘣 Top'
				elseif cL == tL then
					return '󰘡 Bot'
				end

				local result, _ = math.modf((cL / tL) * 100)
				local percentage = string.format('%02d', result)

				return '󰉸 ' .. percentage .. '%%'
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
			-- Right
			ViMode,
			Space,
			GitBlock,
			Space,
			Lazy,
			Align,

			-- Center
			LSPBlock,
			Align,

			-- Left
			FileIcon,
			Space,
			FileType,
			Space,
			FileIndent,
			Space,
			FileFormat,
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
	end,
}
