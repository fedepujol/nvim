-- Nvim-Lsp-Installer
require('nvim-lsp-installer').setup({
	ensure_installed = {
		'angularls', 'bashls', 'cssls',
		'emmet_ls', 'html',
		'jsonls', 'jdtls', 'sumneko_lua',
		'tsserver', 'vimls',
		'lemminx', 'yamlls'
	},
	automatic_installation = false,
	ui = {
		check_outdated_servers_on_open = false,
		border = 'rounded',
		icons = {
			server_installed = '﫟',
			server_pending = '神',
			server_uninstalled = '',
		},
		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = 'i',
			update_server = 'u',
			check_server_version = 'c',
			update_all_servers = 'U',
			check_outdated_servers = 'C',
			uninstall_server = 'X'
		}
	},
})
