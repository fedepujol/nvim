-- Lsp Config
return {
	'neovim/nvim-lspconfig',
	event = 'BufReadPre',
	dependencies = {
		'j-hui/fidget.nvim',
		'b0o/SchemaStore.nvim',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'saghen/blink.cmp',
		{ url = 'https://gitlab.com/schrieveslaach/sonarlint.nvim' },
	},
	config = function()
		-- Mason Setup
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
			automatic_enable = false,
			ensure_installed = {
				'bashls',
				'jsonls',
				'lua_ls',
				'vimls',
				'yamlls',
			},
		})

		vim.keymap.set('n', '<leader>um', ':Mason<CR>', { desc = '[m]ason' })
		-- Capabilities
		-- Base LSP capabilities
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		-- blink.cmp capabilities
		capabilities = vim.tbl_deep_extend(
			'force',
			capabilities,
			require('blink.cmp').get_lsp_capabilities({}, false)
		)

		-- Custom capabilities
		capabilities = vim.tbl_deep_extend('force', capabilities, {
			workspace = {
				didChangeConfiguration = { dynamicRegistration = true },
				didChangeWatchedFiles = { dynamicRegistration = true },
				didChangeWorkspaceFolders = { dynamicRegistration = true },
			},
		}, {
			textDocument = {
				foldingRange = {
					dynamicRegistration = true,
					lineFoldingOnly = true,
				},
			},
		})

		-- Servers
		local lspconfig = require('lspconfig')
		local pses = require('utils').mason
			.. '/packages/powershell-editor-services/PowerShellEditorServices'

		local servers_custom = {
			bashls = {},
			cssls = {
				filetypes = { 'css' },
			},
			dockerls = {
				settings = {
					docker = {
						languageserver = {
							formatter = {
								ignoreMultilineInstructions = true,
							},
						},
					},
				},
			},
			kotlin_language_server = {},
			lemminx = {},
			lua_ls = {},
			marksman = {},
			openedge_ls = {},
			prosemd_lsp = {},
			pylsp = {},
			rust_analyzer = {},
			somesass_ls = {},
			ts_ls = {},
			vimls = {},
			nil_ls = {
				settings = {
					['nil'] = {
						formatting = {
							command = { 'nixpkgs-fmt' },
						},
					},
				},
			},
			angularls = {
				filetypes = { 'htmlangular', 'typescript' },
			},
			html = {
				filetypes = { 'htmlangular', 'html', 'templ' },
			},
			emmet_ls = {
				filetypes = { 'htmlangular', 'html', 'less', 'sass', 'scss' },
			},
			ltex = {
				filetypes = { 'markdown', 'org', 'plaintext' },
			},
			jsonls = {
				settings = {
					json = {
						schemas = require('schemastore').json.schemas(),
						validate = {
							enable = true,
						},
					},
				},
			},
			powershell_es = {
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
				bundle_path = pses,
			},
			yamlls = {
				settings = {
					yaml = {
						schemaStore = {
							enable = false,
							url = '',
						},
						schemas = require('schemastore').yaml.schemas(),
						validate = {
							enable = true,
						},
					},
				},
			},
		}

		require('sonarlint').setup({
			server = {
				cmd = {
					'sonarlint-language-server',
					'-stdio',
					'-analyzers',
					vim.fn.expand('$MASON/share/sonarlint-analyzers/sonarjava.jar'),
					vim.fn.expand(
						'$MASON/share/sonarlint-analyzers/sonarjavasymbolicexecution.jar'
					),
				},
			},
			filetypes = {
				'java',
			},
		})

		for name, config in pairs(servers_custom) do
			config = vim.tbl_extend('force', {}, { capabilities = capabilities }, config)
			lspconfig[name].setup(config)
		end

		-- Mappings
		vim.keymap.set(
			'n',
			'<leader>lq',
			vim.diagnostic.setloclist,
			{ desc = '[l]sp open [q]uickfix' }
		)

		-- Use an on_attach function to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)
				local map = function(keys, func, desc, mode)
					mode = mode or 'n'
					vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = '[l]sp ' .. desc })
				end

				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				--
				-- Go to declaration of world under cursor, not to be confused with DEFINITION
				map('<leader>lgD', vim.lsp.buf.declaration, '[g]o to [D]eclaration')

				-- Go to definition of world under cursor
				map('<leader>lgd', vim.lsp.buf.definition, '[g]o to [d]efinition')

				-- Hover signature or documentation
				map('<leader>lK', vim.lsp.buf.hover, '[K]hover')

				-- Go to implementation
				map('<leader>lgi', vim.lsp.buf.implementation, '[g]o to [i]mplementation')

				-- Signature help
				map('<leader>lsh', vim.lsp.buf.signature_help, 'Show [s]ignature [h]elp')

				-- Diagnostics
				map('[d', function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, 'Next [diagnostic')

				map(']d', function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, 'Prev ]diagnostic')

				-- Type definition
				map('<leader>lgtd', vim.lsp.buf.type_definition, '[g]o [t]ype [d]efinition')

				-- Rename variable under cursor
				map('<leader>lrn', vim.lsp.buf.rename, '[r]e[n]ame')

				-- Execute a code action
				map('<leader>lca', vim.lsp.buf.code_action, 'Show [c]ode [a]ction', { 'n', 'v' })

				-- Finde references under cursor
				map('<leader>lgr', vim.lsp.buf.references, '[g]o to [r]eferences')

				-- Find all symbols in the current document
				map('<leader>lsc', vim.lsp.buf.document_symbol, '[s]ymbol [c]urrent document')

				-- Find all symbols in the current document
				map('<leader>lsw', vim.lsp.buf.workspace_symbol, '[s]ymbol [w]orkspace')
			end,
		})

		-- UI
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
			virtual_text = {
				source = true,
			},
			signs = true,
			underline = true,
			float = {
				source = true,
			},
		})

		---@diagnostic disable: duplicate-set-field
		local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or border
			return orig_util_open_floating_preview(contents, syntax, opts, ...)
		end
	end,
}
