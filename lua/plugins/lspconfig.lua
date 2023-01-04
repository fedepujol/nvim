-- Lsp Config
return {
	{ 'williamboman/mason.nvim',
		event = "BufReadPost",
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
			'neovim/nvim-lspconfig',
			'j-hui/fidget.nvim',
		},
		config = function()
			require('mason').setup({
				ui = {
					check_outdated_packages_on_open = false,
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
				}
			})

			require('mason-lspconfig').setup({
				automatic_installation = false,
				ensure_installed = {
					'angularls', 'bashls', 'cssls',
					'emmet_ls', 'html',
					'jsonls', 'jdtls', 'sumneko_lua',
					'tsserver', 'vimls',
					'lemminx', 'yamlls'
				},
			})

			-- Mappings
			local key_opts = { noremap = true, silent = true }
			vim.keymap.set('n', 'dl', vim.diagnostic.open_float, key_opts)
			vim.keymap.set('n', 'dp', vim.diagnostic.goto_prev, key_opts)
			vim.keymap.set('n', 'dn', vim.diagnostic.goto_next, key_opts)
			vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, key_opts)

			-- Use an on_attach function to only map the following keys
			-- after the language server attaches to the current buffer
			local function on_attach(_, bufnr)
				-- Enable completion triggered by <c-x><c-o>
				vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
				vim.keymap.set('n', 'sh', vim.lsp.buf.signature_help, bufopts)
				vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
				vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
				vim.keymap.set('n', '<space>wl', function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, bufopts)
				vim.keymap.set('n', 'D', vim.lsp.buf.type_definition, bufopts)
				vim.keymap.set('n', 'rn', vim.lsp.buf.rename, bufopts)
				vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, bufopts)
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
			end

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

			-- Handlers
			vim.lsp.diagnostic.config = {
				virtual_text = true,
				signs = true,
				underline = true,
				update_on_insert = false,
				source = 'always',
				severity_sort = false,
				float = {
					source = 'always',
				},
			}

			local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
			function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
				opts = opts or {}
				opts.border = opts.border or border
				return orig_util_open_floating_preview(contents, syntax, opts, ...)
			end

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

			local function getOS()
				local system_name = ''
				if vim.fn.has('mac') == 1 then
					system_name = 'macOS'
				elseif vim.fn.has('unix') == 1 then
					system_name = 'Linux'
				else
					system_name = 'Windows'
				end
				return system_name
			end

			local function isOS(target)
				local os = getOS()
				return os ~= '' and os:lower() == target
			end

			local function prefix()
				local osPrefix = ''
				if isOS('windows') then
					osPrefix = '.cmd'
				end
				return osPrefix
			end

			local dir = vim.fn.stdpath('data') .. '/mason'

			local root_pattern = require('lspconfig.util').root_pattern

			-- Angular LSP
			local angular_dir = dir .. '/angularls/node_modules'
			local ngLangSvc = angular_dir .. '/@angular/language-service'
			local typescript = angular_dir .. '/typescript/lib'
			local new_cmd = {
				angular_dir .. '/.bin/ngserver' .. prefix(),
				'--stdio',
				'--tsProbeLocations',
				typescript,
				'--ngProbeLocations',
				ngLangSvc,
			}

			require('lspconfig').angularls.setup({
				-- cmd = new_cmd,
				-- on_new_config = function(new_config)
				-- 	new_config.cmd = new_cmd
				-- end,
				root_dir = root_pattern({ '.angular-cli.json', 'angular.json' }),
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- Bash LSP
			require('lspconfig').bashls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				cmd_env = {
					GLOB_PATTERN = '*@(.sh|.inc|.bash|.zsh|.command)',
				},
				filetypes = { 'sh', 'zsh' },
				single_file_support = true
			})

			-- CSS LSP
			require('lspconfig').cssls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { 'css', 'scss', 'less' },
				settings = {
					css = {
						validate = true,
					},
				},
			})

			-- Emmet LSP
			require('lspconfig').emmet_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				root_dir = root_pattern({ '.git', '*.html', '*.css' }),
				filtypes = { 'html', 'css' },
			})

			-- HTML LSP
			--Enable (broadcasting) snippet capability for completion
			require('lspconfig').html.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				provideFormatter = true,
				single_file_support = true
			})

			-- JSON LSP
			require('lspconfig').jsonls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					json = {
						validate = {
							enable = true,
						},
						schemas = {
							{
								fileMatch = { 'package.json' },
								url = 'https://json.schemastore.org/package.json'
							},
							{
								fileMatch = { 'tsconfig*.json' },
								url = 'https://json.schemastore.org/tsconfig.json'
							},
							{
								fileMatch = { 'tslint.json' },
								url = 'https://json.schemastore.org/tslint.json'
							},
							{
								fileMatch = { '.angular-cli.json' },
								url = 'https://json.schemastore.org/angular-cli.json'
							},
							{
								fileMatch = { 'angular.json' },
								url = 'https://raw.githubusercontent.com/angular/angular-cli/master/packages/angular/cli/lib/config/workspace-schema.json'
							},
							{
								fileMatch = { '.eslintrc' },
								url = 'https://json.schemastore.org/eslintrc.json'
							},
							{
								fileMatch = { '.vsconfig ' },
								url = 'https://json.schemastore.org/vsconfig.json'
							}
						}
					}
				}
			})

			-- Lua LSP
			local runtime_path = vim.split(package.path, ';')

			table.insert(runtime_path, 'lua/?.lua')
			table.insert(runtime_path, 'lua/?/init.lua')

			require('lspconfig').sumneko_lua.setup({
				-- cmd = { dir .. '/sumneko_lua/extension/server/bin/lua-language-server' },
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which versin of Lua you're using (most likely LuaJIT in the case of Neovim)
							version = 'LuaJIT',
							-- Setup your lua path
							path = runtime_path,
						},
						diagnostics = {
							-- Get the language server to recognize the 'vim' global
							globals = { 'vim' },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file('', true),
						},
						-- Do not send telemetry data
						telemetry = {
							enable = false,
						},
					},
				},
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- Python LSP
			require('lspconfig').pylsp.setup({
				filetypes = { 'python' },
				on_attach = on_attach,
				capabilities = capabilities,
				single_file_support = true,
			})

			-- TSServer LSP
			require('lspconfig').tsserver.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				hostInfo = "neovim"
			})

			-- Vim LSP
			require('lspconfig').vimls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				init_options = {
					diagnostic = {
						enable = true,
					},
					indexes = {
						count = 3,
						gap = 100,
						projectRootPatterns = { 'runtime', 'nvim', '.git', 'autoload', 'plugin' },
						runtimepath = true,
					},
					isNeovim = true,
					suggest = {
						fromRuntimepath = true,
						fromVimruntime = true,
					},
				},
			})

			-- Yaml LSP
			require('lspconfig').yamlls.setup({
				filetypes = { 'yml', 'yaml' },
				root_dir = root_pattern({ '.git', vim.fn.getcwd() }),
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					yaml = {
						schemas = {
							['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = 'docker-compose.yml',
							['https://yarnpkg.com/configuration/yarnrc.json'] = '.yarnrc.yml',
							['https://json.schemastore.org/yamllint.json'] = 'yamllint',
						}
					}
				}
			})
		end
	}
}
