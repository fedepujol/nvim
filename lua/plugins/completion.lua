-- Blink.CMP
---@module "lazy"
---@type LazyPluginSpec
return {
	'saghen/blink.cmp',
	event = 'InsertEnter',
	dependencies = { 'L3MON4D3/LuaSnip' },
	version = '1.*',
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
				preset = 'enter',
			},
			appearance = {
				nerd_font_variant = 'mono',
			},
			completion = {
				list = {
					selection = {
						preselect = true,
						auto_insert = false,
					},
				},
				menu = {
					border = 'rounded',
					draw = {
						columns = {
							{ 'label', 'label_description', gap = 1 },
							{ 'kind_icon', 'source_name' },
						},
						components = {
							kind_icon = {
								text = function(ctx)
									return ' ' .. string.format('%s', kind_icons[ctx.kind])
								end,
							},
						},
						treesitter = { 'lsp' },
					},
				},
				documentation = {
					window = {
						border = 'rounded',
					},
					auto_show = true,
					auto_show_delay_ms = 500,
				},
			},
			signature = {
				enabled = true,
				window = {
					border = 'rounded',
					show_documentation = false,
				},
			},
			snippets = {
				preset = 'luasnip',
			},
			sources = {
				default = {
					'buffer',
					'lazydev',
					'lsp',
					'path',
					'snippets',
				},
				providers = {
					buffer = {
						name = '[buffer]',
						min_keyword_length = 4,
					},
					lazydev = {
						module = 'lazydev.integrations.blink',
						score_offset = 100,
					},
					lsp = {
						name = '[lsp]',
					},
					path = {
						name = '[path]',
					},
					snippets = {
						name = '[snippets]',
					},
				},
			},
			fuzzy = {
				implementation = 'lua',
			},
		})
	end,
}
