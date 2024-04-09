-- Nvim-CMP

return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip',
		'mattn/emmet-vim',
	},
	config = function()
		local cmp = require('cmp')

		local feedkey = function(key, mode)
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
		end

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

		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn['vsnip#anonymous'](args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = {
				['<CR>'] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),
				['<C-n>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif vim.fn['vsnip#available'](1) == 1 then
						feedkey('<Plug>(vsnip-expand-or-jump)', '')
					else
						fallback()
					end
				end, { 'i', 's' }),
				['<C-p>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif vim.fn['vsnip#available'](-1) == 1 then
						feedkey('<Plug>(vsnip-jump-prev)', '')
					else
						fallback()
					end
				end, { 'i', 's' }),
				['<C-SPACE>'] = cmp.mapping.complete(),
				['<ESC>'] = cmp.mapping.close(),
				['<C-d>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
			},
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'nvim_lsp_signature_help' },
				{ name = 'nvim_lua' },
				{ name = 'vsnip' },
				{ name = 'path' },
			},
			formatting = {
				format = function(entry, vim_item)
					vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
					vim_item.menu = ({
						nvim_lsp = '[Lsp]',
						nvim_lua = '[Lua]',
						visnip = '[Snippet]',
						path = '[Path]',
						buffer = '[Buffer]',
					})[entry.source.name]
					return vim_item
				end,
			},
		})

		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' },
			}, {
				{ name = 'cmdline' },
			}),
		})

		-- Add parenthesis to functions and methods
		local cmp_autopairs = require('nvim-autopairs.completion.cmp')
		cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
	end,
}
