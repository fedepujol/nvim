-- Lsp Config
return {
	'neovim/nvim-lspconfig',
	event = 'BufReadPre',
	dependencies = {
		'folke/neodev.nvim',
		'j-hui/fidget.nvim',
		'b0o/SchemaStore.nvim',
		{ 'williamboman/mason.nvim', build = ':MasonUpdate' },
		'williamboman/mason-lspconfig.nvim',
	},
	config = function()
		require('mason').setup({
			log_level = vim.log.levels.DEBUG,
			ui = {
				check_outdated_packages_on_open = false,
				border = 'rounded',
				icons = {
					package_installed = ' ',
					package_pending = '󰦖 ',
					package_uninstalled = '',
				},
				keymaps = {
					toggle_server_expand = '<CR>',
					install_server = 'i',
					update_server = 'u',
					check_server_version = 'c',
					update_all_servers = 'U',
					check_outdated_servers = 'C',
					uninstall_server = 'X',
				},
			},
		})

		require('mason-lspconfig').setup({
			automatic_installation = false,
			ensure_installed = {
				'bashls',
				'jsonls',
				'lua_ls',
				'vimls',
				'yamlls',
			},
		})

		-- Mappings
		local key_opts = { noremap = true, silent = true, desc = '' }
		vim.keymap.set('n', 'dl', vim.diagnostic.open_float, key_opts)
		vim.keymap.set('n', 'dp', vim.diagnostic.goto_prev, key_opts)
		vim.keymap.set('n', 'dn', vim.diagnostic.goto_next, key_opts)
		vim.keymap.set(
			'n',
			'<space>q',
			vim.diagnostic.setloclist,
			{ noremap = true, silent = true, desc = 'Open QuickFix' }
		)

		-- Use an on_attach function to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
				vim.keymap.set('n', 'sh', vim.lsp.buf.signature_help, opts)
				vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set('n', '<space>wl', function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set('n', 'D', vim.lsp.buf.type_definition, opts)
				vim.keymap.set('n', 'rn', vim.lsp.buf.rename, opts)
				vim.keymap.set({ 'n', 'v' }, 'ca', vim.lsp.buf.code_action, opts)
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
			end,
		})

		local border = {
			{ '╭', 'FloatBorder' },
			{ '─', 'FloatBorder' },
			{ '╮', 'FloatBorder' },
			{ '│', 'FloatBorder' },
			{ '╯', 'FloatBorder' },
			{ '─', 'FloatBorder' },
			{ '╰', 'FloatBorder' },
			{ '│', 'FloatBorder' },
		}

		local signs = {
			Error = '',
			Warn = '',
			Hint = '󰌵',
			Info = '',
		}

		for type, icon in pairs(signs) do
			local hl = 'DiagnosticSign' .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		-- Handlers
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			float = {
				source = true,
			},
		})

		local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or border
			return orig_util_open_floating_preview(contents, syntax, opts, ...)
		end

		local capabilities = vim.tbl_deep_extend(
			'force',
			vim.lsp.protocol.make_client_capabilities(),
			require('cmp_nvim_lsp').default_capabilities(),
			{
				workspace = {
					didChangeConfiguration = { dynamicRegistration = true },
					didChangeWatchedFiles = { dynamicRegistration = true },
					didChangeWorkspaceFolders = { dynamicRegistration = true },
				},
			},
			{
				textDocument = {
					foldingRange = {
						dynamicRegistration = true,
						lineFoldingOnly = true,
					},
				},
			}
		)

		-- Neodev setup
		require('neodev').setup({
			library = {
				enabled = true,
				runtime = true, -- runtime path
				types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
				plugins = true, -- installed opt or start plugins in packpath
			},
			setup_jsonls = false,
			lspconfig = true,
			pathStrict = true,
		})

		local lspconfig = require('lspconfig')
		local servers = {
			'angularls',
			'bashls',
			'cssls',
			'emmet_ls',
			'eslint',
			'html',
			'kotlin_language_server',
			'lemminx',
			'lua_ls',
			'marksman',
			'nixd',
			'prosemd_lsp',
			'pylsp',
			'rust_analyzer',
			'tsserver',
			'vimls',
		}

		for _, value in pairs(servers) do
			lspconfig[value].setup({
				capabilities = capabilities,
			})
		end

		-- LTEX LSP
		require('lspconfig').ltex.setup({
			capabilities = capabilities,
			filetypes = { 'markdown', 'org', 'plaintext' },
		})

		-- JSON LSP
		require('lspconfig').jsonls.setup({
			capabilities = capabilities,
			settings = {
				json = {
					validate = {
						enable = true,
					},
					schemas = require('schemastore').json.schemas({
						select = {
							'.angular-cli.json',
							'.eslintrc',
							'.vsconfig',
							'angular.json',
							'launchsettings.json',
							'package.json',
							'task.json',
							'tsconfig.json',
							'tslint.json',
						},
					}),
				},
			},
		})

		-- PowerShell
		local pses = require('utils').mason
			.. '/packages/powershell-editor-services/PowerShellEditorServices'
		require('lspconfig').powershell_es.setup({
			cmd = {
				'powershell',
				'-NoLogo',
				'-NoProfile',
				'-Command',
				pses .. '/Start-EditorServices.ps1',
				'-BundledModulesPath',
				pses,
				'-LogPath',
				pses .. '/log/pwsh.log',
				'-SessionDetailsPath',
				pses .. '/session.json',
				'-FeatureFlags',
				'@()',
				'-AdditionalModules',
				'@()',
				'-HostName',
				'nvim',
				'-HostProfileId',
				'0',
				'-HostVersion',
				'1.0.0',
				'-Stdio',
				'-LogLevel',
				'Normal',
			},
			shell = 'powershell',
			capabilities = capabilities,
			bundle_path = pses,
		})

		-- Yaml LSP
		require('lspconfig').yamlls.setup({
			capabilities = capabilities,
			settings = {
				yaml = {
					schemas = require('schemastore').yaml.schemas({
						select = {
							'docker-compose.yml',
							'yamllint',
						},
					}),
				},
			},
		})
	end,
}
