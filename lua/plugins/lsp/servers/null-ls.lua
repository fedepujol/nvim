-- Null-ls
local null_ls = require('null-ls')
local helpers = require('null-ls.helpers')
local builtins = require('null-ls.builtins')

local htmlBeautify = helpers.make_builtin({
	name = 'htmlBeautify',
	method = null_ls.methods.FORMATTING,
	filetypes = { 'html' },
	generator_opts = {
		command = 'html-beautify',
		args = helpers.range_formatting_args_factory({
			'-t',
			'-n',
			'-w 110',
			'-m 0',
			"$FILENAME"
		}),
		to_stdin = true,
	},
	factory = helpers.formatter_factory
})

local pandoc = helpers.make_builtin({
	name = 'pandoc',
	method = null_ls.methods.FORMATTING,
	filetypes = { 'markdown' },
	generator_opts = {
		command = 'pandoc',
		args = helpers.range_formatting_args_factory({
			'-f',
			'markdown',
			'-t',
			'-gfm',
			'-p',
			"$FILENAME"
		}),
		on_output = function(params)
			print(vim.inspect(params))
		end,
		to_stdin = true,
	},
	factory = helpers.formatter_factory
})

local tslint = helpers.make_builtin({
	name = 'tslint',
	method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
	filetypes = { 'typescript' },
	generator_opts = {
		command = 'tslint',
		args = {
			'-t',
			'json',
			'-p',
			vim.fn.getcwd(),
			'$FILENAME'
		},
		to_stdin = true,
		from_stderr = true,
		format = 'json',
		on_output = function(params)
			local diagnostics = {}
			for _, value in ipairs(params.output) do
				local diagnostic = {
					col = value.startPosition.character + 1,
					row = value.startPosition.line + 1,
					end_col = value.endPosition.character + 1,
					end_row = value.endPosition.line + 1,
					message = value.failure,
					severity = 2
				}
				table.insert(diagnostics, diagnostic)
			end
			return diagnostics
		end,
	},
	factory = helpers.generator_factory
})

local sources = {
	-- Formatters
	htmlBeautify,
	pandoc,
	builtins.formatting.prettier.with({
		filetypes = { 'yaml' },
		extra_args = {
			'--use-tabs',
			'-tab-width=4',
		}
	}),
	-- Diagnostics
	builtins.diagnostics.jsonlint,
	builtins.diagnostics.markdownlint,
	builtins.diagnostics.shellcheck,
	tslint,
	builtins.diagnostics.vint,
	builtins.diagnostics.yamllint
}

null_ls.setup({
	sources = sources,
	debug = true,
	on_attach = require('plugins.lsp.config').on_attach,
	default_timeout = 50000,
})
