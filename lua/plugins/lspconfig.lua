-- Lsp Config
---@module "lazy"
---@type LazyPluginSpec
return {
	'neovim/nvim-lspconfig',
	event = 'BufReadPre',
	dependencies = {
		'j-hui/fidget.nvim',
		'b0o/SchemaStore.nvim',
		{ 'mason-org/mason.nvim', version = '2.*' },
		{ 'mason-org/mason-lspconfig.nvim', version = '2.*' },
		'saghen/blink.cmp',
		{ url = 'https://gitlab.com/schrieveslaach/sonarlint.nvim' },
	},
	config = function()
		-- Mason Setup
		require('mason').setup({
			registries = {
				'file:~/sid/nvim/mason-registry',
			},
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
			ensure_installed = {},
		})

		vim.keymap.set('n', '<leader>um', ':Mason<CR>', { desc = '[m]ason' })

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

		-- Disable the default keybinds
		for _, bind in ipairs({ 'grn', 'grr', 'gri', 'gO', 'gra' }) do
			pcall(vim.keymap.del, 'n', bind)
		end

		-- Use an on_attach function to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)
				-- Disable semantic tokens for clang
				local client = vim.lsp.get_client_by_id(ev.data.client_id)
				if client ~= nil and client.name == 'clangd' then
					client.server_capabilities.semanticTokensProvider = nil
				end

				if
					client
					and client:supports_method('textDocument/codeLens')
					and client.name == 'markdown_oxide'
				then
					vim.lsp.codelens.refresh()
					vim.api.nvim_create_autocmd(
						{ 'TextChanged', 'BufEnter', 'CursorHold', 'InsertLeave' },
						{
							buffer = ev.buf,
							callback = vim.lsp.codelens.refresh,
						}
					)
				end

				local map = function(keys, func, desc, mode)
					mode = mode or 'n'
					vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = '[l]sp ' .. desc })
				end

				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				--

				-- Format
				map('<leader>lf', vim.lsp.buf.format, '[l]sp [f]ormat')

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
					vim.diagnostic.jump({ count = -1, float = true, wrap = true })
				end, 'Next [diagnostic')

				map(']d', function()
					vim.diagnostic.jump({ count = 1, float = true, wrap = true })
				end, 'Prev ]diagnostic')

				-- Type definition
				map('<leader>lgtd', vim.lsp.buf.type_definition, '[g]o [t]ype [d]efinition')

				-- Rename variable under cursor
				map('<leader>lrn', vim.lsp.buf.rename, '[r]e[n]ame')

				-- Execute a code action
				map('<leader>lca', vim.lsp.buf.code_action, 'Show [c]ode [a]ction', { 'n', 'v' })

				-- -- Finde references under cursor
				-- map('<leader>lgr', vim.lsp.buf.references, '[g]o to [r]eferences')

				-- Find all symbols in the current document
				-- map('<leader>lsc', vim.lsp.buf.document_symbol, '[s]ymbol [c]urrent document')

				-- Find all symbols in the current document
				-- map('<leader>lsw', vim.lsp.buf.workspace_symbol, '[s]ymbol [w]orkspace')
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

		-- Handlers
		-- Disable Neovim's default virtual text diagnostics
		vim.diagnostic.config({ virtual_text = false })
		-- vim.diagnostic.config({
		-- 	severity_sort = true,
		-- 	virtual_text = {
		-- 		source = true,
		-- 		spacing = 2,
		-- 	},
		-- 	signs = {
		-- 		text = {
		-- 			[vim.diagnostic.severity.ERROR] = '',
		-- 			[vim.diagnostic.severity.WARN] = '',
		-- 			[vim.diagnostic.severity.HINT] = '󰌵',
		-- 			[vim.diagnostic.severity.INFO] = '',
		-- 		},
		-- 	},
		-- 	underline = {
		-- 		severity = { vim.diagnostic.severity.WARN, vim.diagnostic.severity.ERROR },
		-- 	},
		-- 	float = {
		-- 		border = 'rounded',
		-- 		source = true,
		-- 		header = '󰔫',
		-- 	},
		-- })

		---@diagnostic disable: duplicate-set-field
		local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or border
			return orig_util_open_floating_preview(contents, syntax, opts, ...)
		end

		-- Capabilities
		-- Base LSP capabilities
		--- @type lsp.ClientCapabilities
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		-- blink.cmp capabilities
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
		}, require('blink.cmp').get_lsp_capabilities({}, false))

		-- Servers
		local servers = {
			'angularls',
			'bashls',
			'clangd',
			'cssls',
			'dockerls',
			'emmet_ls',
			'eslint',
			'gradle_ls',
			'harper_ls',
			'html',
			'jsonls',
			'lemminx',
			'lua_ls',
			'markdown_oxide',
			'powershell_es',
			'pylsp',
			'rust_analyzer',
			'somesass_ls',
			'ts_ls',
			'vimls',
			'yamlls',
		}

		-- Config LSPs
		vim.lsp.config('*', { capabilities = capabilities })
		for _, name in pairs(servers) do
			vim.lsp.enable(name)
		end
	end,
}
