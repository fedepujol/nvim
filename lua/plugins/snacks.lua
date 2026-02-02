---@module "lazy"
---@type LazyPluginSpec
return {
	'folke/snacks.nvim',
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		input = { enabled = true },
		picker = {
			enabled = true,
			sources = {
				files = {
					layout = { preview = false },
				},
			},
		},
		lazygit = { enabled = true },
	},
	keys = {
		-- find
		{
			'<leader>sb',
			function()
				Snacks.picker.buffers()
			end,
			desc = '[s]earch [b]uffers',
		},
		{
			'<leader>sf',
			function()
				Snacks.picker.files()
			end,
			desc = '[s]earch [f]iles',
		},
		-- Grep
		{
			'<leader>sg',
			function()
				Snacks.picker.grep()
			end,
			desc = '[s]earch with [g]rep',
		},
		-- search
		{
			'<leader>sld',
			function()
				Snacks.picker.diagnostics()
			end,
			desc = '[s]earch [l]sp [d]iagnostics',
		},
		{
			'<leader>sh',
			function()
				Snacks.picker.help()
			end,
			desc = '[s]earch [h]elp',
		},
		{
			'<leader>si',
			function()
				Snacks.picker.icons()
			end,
			desc = '[s]earch [i]cons',
		},
		-- LSP
		{
			'<leader>lgr',
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = '[g]o [r]eferences',
		},
		{
			'<leader>lgai',
			function()
				Snacks.picker.lsp_incoming_calls()
			end,
			desc = '[l]sp c[a]lls incoming',
		},
		{
			'<leader>lgao',
			function()
				Snacks.picker.lsp_outgoing_calls()
			end,
			desc = '[l]sp c[a]lls outgoing',
		},
		{
			'<leader>lss',
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = '[l][s]p [s]ymbols',
		},
		{
			'<leader>lsS',
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = '[l]sp work[s]pace [S]ymbols',
		},
		-- Other
		{
			'<leader>uN',
			desc = 'Neovim News',
			function()
				Snacks.win({
					file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
					width = 0.6,
					height = 0.6,
					wo = {
						spell = false,
						wrap = false,
						signcolumn = 'yes',
						statuscolumn = ' ',
						conceallevel = 3,
					},
				})
			end,
		},
	},
	init = function()
		vim.api.nvim_create_autocmd('User', {
			pattern = 'VeryLazy',
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end

				-- Override print to use snacks for `:=` command
				if vim.fn.has('nvim-0.11') == 1 then
					vim._print = function(_, ...)
						dd(...)
					end
				else
					vim.print = _G.dd
				end
			end,
		})
	end,
}
