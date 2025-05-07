-- Blink.CMP

return {
	'saghen/blink.cmp',
	event = 'InsertEnter',
	dependencies = {
		'L3MON4D3/LuaSnip',
		version = "2.*",
		build = (function()
			if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then
				return
			end
			return 'make install_jsregexp'
		end)()
	},
	version = "1.*",
	config = function()
		local blink = require('blink.cmp')

		local kind_icons = {
			Class = ' ',
			Color = ' ',
			Constant = ' ',
			Constructor = '󱌣 ',
			Enum = ' ',
			EnumMember = ' ',
			Event = ' ',
			Field = ' ',
			File = '󰱾 ',
			Folder = '󰉋 ',
			Function = '󰊕 ',
			Interface = ' ',
			Keyword = '󰌋 ',
			Method = '󰅲 ',
			Module = '󰅪 ',
			Operator = ' ',
			Property = ' ',
			Reference = ' ',
			Snippet = ' ',
			Struct = ' ',
			Text = ' ',
			TypeParameter = ' ',
			Unit = '󰎤 ',
			Value = ' ',
			Variable = ' ',
		}

		---@module "blink.cmp"
		---@type blink.cmp.Config
		blink.setup({
			keymap = {
				preset = "enter",
			},
			appearance = {
				nerd_font_variant = "mono"
			},
			completion = {
				list = {
					selection = {
						preselect = false,
						auto_insert = true
					}
				},
				menu = {
					border = "rounded",
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 }, { "kind_icon", "source_name" }
						},
						components = {
							kind_icon = {
								text = function(ctx)
									return ' ' .. string.format('%s', kind_icons[ctx.kind])
								end
							}
						}
					}
				},
				documentation = {
					window = {
						border = "rounded"
					},
					auto_show = false,
					auto_show_delay_ms = 500
				}
			},
			signature = {
				enabled = true,
				window = {
					border = "rounded",
					show_documentation = false
				}
			},
			snippets = {
				preset = 'luasnip'
			},
			sources = {
				default = {
					"lsp", "path", "snippets", "buffer", "lazydev"
				},
				providers = {
					lazydev = {
						module = 'lazydev.integrations.blink', score_offset = 100
					}
				}
			},
			fuzzy = {
				implementation = "prefer_rust_with_warning"
			}
		})
	end,
}
