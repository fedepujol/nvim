---@module "lazy"
---@type LazyPluginSpec
return {
	'L3MON4D3/LuaSnip',
	version = '2.*',
	build = (function()
		if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then
			return
		end
		return 'make install_jsregexp'
	end)(),
	config = function()
		local luasnip = require('luasnip')
		local types = require('luasnip.util.types')

		luasnip.config.set_config({
			-- Remember the last snippet used
			history = true,

			-- When using dynamic snippets, it updates them as you type
			updateevents = 'TextChanged, TextChangedI',

			-- Autosnippets
			enable_autosnippets = true,

			-- Crazy highlights
			ext_opts = {
				[types.choiceNode] = {
					active = {
						virt_text = { { '<-', 'Error' } },
					},
				},
			},
		})

		-- Expand current item or jump to the next one
		vim.keymap.set({ 'i', 's' }, '<c-k>', function()
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { silent = true })

		-- Backwards jump
		vim.keymap.set({ 'i', 's' }, '<c-j>', function()
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { silent = true })

		-- Choices toggle
		vim.keymap.set('i', '<c-l>', function()
			if luasnip.choice_active() then
				luasnip.change_choice(1)
			end
		end, { silent = true })
	end,
}
