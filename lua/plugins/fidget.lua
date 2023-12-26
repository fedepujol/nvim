-- Fidget.nvim

return {
	'j-hui/fidget.nvim',
	event = 'VeryLazy',
	config = function()
		require('fidget').setup({
			progress = {
				ignore_done_already = true,
				ignore_empty_message = true,
				display = {
					overrides = {
						angularls = { name = '󰚲 angular-lsp'},
						bashls = { name = ' bash-lsp'},
						cssls = { name = ' css-lsp'},
						emmet_ls = { name = '<EMMET> emmet-lsp'},
						eslint = { name = '󰱺 eslint-lsp'},
						html = { name = '󰌝 html-lsp'},
						jdtls = { name = '󰬷 jdtls' },
						jsonls = { name = '󰘦 json-lsp'},
						kotlin_language_server = { name = '󱈙 kotlin-lsp'},
						lemminx = { name = '<XML> lemminx-lsp'},
						ltex = { name = '󰍔 ltex-lsp'},
						lua_ls = { name = '󰢱 lua_ls' },
						marksman = { name = '󰍔 marksman-lsp'},
						nixd = { name = '󱄅 nixd-lsp'},
						powershell_es = { name = '󰨊 powershell-lsp'},
						prosemd_lsp = { name = '󰍔 prosemd-lsp'},
						pylsp = { name = '󰌠 py-lsp'},
						rust_analyzer = { name = '󱘗 rust-lsp'},
						tsserver = { name = '󰛦 ts-lsp'},
						vimls = { name = ' vim-lsp'},
						yamlls = { name = '<YAML> yaml-lsp'},
					}
				}
			},
			notification = {
				override_vim_notify = true,
			}
		})
	end
}
