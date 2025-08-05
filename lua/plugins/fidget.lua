-- Fidget.nvim
---@module "lazy"
---@type LazyPluginSpec
return {
	'j-hui/fidget.nvim',
	event = 'VimEnter',
	config = function()
		require('fidget').setup({
			progress = {
				ignore_done_already = true,
				ignore_empty_message = true,
				display = {
					overrides = {
						angularls = { name = '󰚲 angularls' },
						bashls = { name = ' bashls' },
						cssls = { name = ' cssls' },
						emmet_ls = { name = '<EMMET> emmet_ls' },
						eslint = { name = '󰱺 eslint' },
						html = { name = '󰌝 html' },
						jdtls = { name = '󰬷 jdtls' },
						jsonls = { name = '󰘦 jsonls' },
						lemminx = { name = '󰗀 lemminx' },
						lua_ls = { name = '󰢱 lua_ls' },
						marksman = { name = '󰍔 marksman' },
						nixd = { name = '󱄅 nixd' },
						nil_ls = { name = '󱄅 nil_ls' },
						powershell_es = { name = '󰨊 powershell_es' },
						harper_ls = { name = '󰍔 harper_ls' },
						pylsp = { name = '󰌠 pylsp' },
						rust_analyzer = { name = '󱘗 rust-analyzer' },
						ts_ls = { name = '󰛦 ts_ls' },
						typescript_tools = { name = '󰛦 ts_tools' },
						vimls = { name = ' vimls' },
						yamlls = { name = '<YAML> yamlls' },
					},
				},
			},
			notification = {
				override_vim_notify = true,
				window = {
					winblend = 90,
				},
			},
		})

		local notification = require('fidget.notification')

		vim.api.nvim_create_autocmd('User', {
			pattern = 'LazyVimStarted',
			callback = function()
				local stats = require('lazy').stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				local footer = '⚡' .. stats.loaded .. ' plugins in ' .. ms .. 'ms'
				notification.notify(
					footer,
					vim.log.levels.INFO,
					{ annote = 'neovim', skip_history = true }
				)
			end,
		})
	end,
}
