-- Nvim-CMP

return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lsp-document-symbol',
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
			Class = '',
			Color = '',
			Constant = ' ',
			Constructor = '襁 ',
			Enum = ' ',
			EnumMember = 'ﱔ ',
			Event = ' ',
			Field = ' ',
			File = ' ',
			Folder = ' ',
			Function = ' ',
			Interface = '壟',
			Keyword = ' ',
			Method = ' ',
			Module = ' ',
			Operator = '駱 ',
			Property = ' ',
			Reference = ' ',
			Snippet = ' ',
			Struct = 'ﴰ ',
			Text = ' ',
			TypeParameter = ' ',
			Unit = ' ',
			Value = ' ',
			Variable = ' ',
		}

		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn['vsnip#anonymous'](args.body)
				end,
			},
			mapping = {
				['<CR>'] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),
				['<TAB>'] = function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif vim.fn['vsnip#available'](1) ~= 0 then
						feedkey('<Plug>(vsnip-expand-or-jump)', '')
					else
						fallback()
					end
				end,
				['<S-TAB>'] = function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif vim.fn['vsnip#available'](1) ~= 0 then
						feedkey('<Plug>(vsnip-jump-prev)', '')
					else
						fallback()
					end
				end,
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
				{ name = 'buffer', keyword_length = 5, max_item_count = 5 },
			},
			formatting = {
				format = function(_, vim_item)
					vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
					return vim_item
				end,
			},
		})

		cmp.setup.cmdline(':', {
			sources = cmp.config.sources({
				{ name = 'cmdline' },
			}),
		})
	end
}
