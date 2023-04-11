-- Lsp Config
return {
	'neovim/nvim-lspconfig',
	event = "BufReadPre",
	dependencies = {
		'folke/neodev.nvim',
		'j-hui/fidget.nvim',
		'b0o/SchemaStore.nvim',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
	},
	config = function()
		require('mason').setup({
			ui = {
				check_outdated_packages_on_open = false,
				border = 'rounded',
				icons = {
					package_installed = '﫟',
					package_pending = '神',
					package_uninstalled = '',
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
				'emmet_ls', 'html', 'jsonls',
				'jdtls', 'lua_ls', 'rust_analyzer',
				'tsserver', 'vimls', 'lemminx',
				'yamlls'
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
			end
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

		local root_pattern = require('lspconfig.util').root_pattern

		-- Neodev setup
		require('neodev').setup({
			library = {
				enabled = true,
				runtime = true, -- runtime path
				types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
				plugins = true, -- installed opt or start plugins in packpath
				-- can be a list to plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
			},
			setup_jsonls = false,
			lspconfig = true,
			pathStrict = true,
		})

		-- Angular LSP
		require('lspconfig').angularls.setup({
			root_dir = root_pattern({ '.angular-cli.json', 'angular.json' }),
			capabilities = capabilities,
		})

		-- Bash LSP
		require('lspconfig').bashls.setup({
			capabilities = capabilities,
			cmd_env = {
				GLOB_PATTERN = '*@(.sh|.inc|.bash|.zsh|.command)',
			},
			filetypes = { 'sh', 'zsh' },
			single_file_support = true
		})

		-- CSS LSP
		require('lspconfig').cssls.setup({
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
			capabilities = capabilities,
			root_dir = root_pattern({ '.git', '*.html', '*.css' }),
			filtypes = { 'html', 'css' },
		})

		-- HTML LSP
		-- Enable (broadcasting) snippet capability for completion
		require('lspconfig').html.setup({
			capabilities = capabilities,
			provideFormatter = true,
			single_file_support = true
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
							'package.json',
							'tsconfig.json',
							'tslint.json',
							'.angular-cli.json',
							'angular.json',
							'.eslintrc',
							'.vsconfig'
						}
					})
				}
			}
		})

		-- Lua LSP
		require('lspconfig').lua_ls.setup({
			-- cmd = { dir .. '/sumneko_lua/extension/server/bin/lua-language-server' },
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which versin of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = 'LuaJIT'
					},
					diagnostics = {
						-- Get the language server to recognize the 'vim' global
						globals = { 'vim' },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file('', true),
						checkThirdParty = false,
					},
					-- Do not send telemetry data
					telemetry = {
						enable = false,
					},
				},
			},
			capabilities = capabilities,
		})

		-- Markdown LSP's
		require('lspconfig').marksman.setup({
			capabilities = capabilities,
			single_file_support = true
		})

		require('lspconfig').prosemd_lsp.setup({
			capabilities = capabilities,
			single_file_support = true
		})

		-- Nix LSP
		require('lspconfig').nil_ls.setup({
			capabilities = capabilities,
			single_file_support = true,
			settings = {
				['nil'] = {
					formatting = {
						command = { "nixpkgs-fmt" }
					}
				}
			}
		})

		-- Python LSP
		require('lspconfig').pylsp.setup({
			filetypes = { 'python' },
			capabilities = capabilities,
			single_file_support = true,
		})

		-- TSServer LSP
		require('lspconfig').tsserver.setup({
			capabilities = capabilities,
			init_options = {
				hostInfo = "neovim"
			},
		})

		-- Rust LSP
		require('lspconfig').rust_analyzer.setup({
			capabilities = capabilities
		})

		-- Vim LSP
		require('lspconfig').vimls.setup({
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
			capabilities = capabilities,
			settings = {
				yaml = {
					schemas = require('schemastore').yaml.schemas({
						select = {
							'docker-compose.yml',
							'.yarnrc.yml',
							'yamllint'
						}
					})
				}
			}
		})
	end
}
