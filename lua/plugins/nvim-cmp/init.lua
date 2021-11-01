-- Nvim-CMP
local cmp = require('cmp')

cmp.setup{
	snippet = {
		expand = function(args)
			vim.fn['vsnip#anonymous'](args.body)
		end,
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true
		}),
		["<S-TAB>"] = cmp.mapping.select_prev_item(),
		["<TAB>"] = cmp.mapping.select_next_item(),
		["<C-SPACE>"] = cmp.mapping.complete(),
		["<ESC>"] = cmp.mapping.close(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = 'vsnip' },
		{ name = "path" },
		{ name = "buffer", keyword_length = 5 },
	},
	formatting = {
		format = function(_, vim_item)
			local itemKind = vim.lsp.protocol.CompletionItemKind

			for index, value in ipairs(itemKind) do
				local a = value:lower():find(vim_item.kind:lower())
				if a ~= nil then
					vim_item.kind = itemKind[index]
				end
			end
			return vim_item
		end
	},
	experimental = {
		ghost_text = true
	}
}

