require('nvim-treesitter.configs').setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    indent = {
        enable = true
    },
    highlight = {
        enable = true,    -- false will disable the whole extension
    },
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounce time for highlighting nodes
		persist_queries = false,
		keybindings = {
			toggle_query_editor = 'o',
			toggle_hl_groups = 'i',
			toggle_injected_languages = 't',
			toggle_anonymous_nodes = 'a',
			toggle_language_display = 'I',
			focus_language = 'f',
			unfocus_language = 'F',
			update = 'R',
			goto_node = '<cr>',
			show_help = '?',
		},
	}
}

vim.api.nvim_exec([[
	hi clear default
	hi default link TSText PreProc
	hi default link TSProperty Constant
	hi default link TSConstBuiltin Constant
	hi default link TSStringScape String
	hi default link TSFuncBuiltin Function
	hi default link TSFuncMacro Function
	hi default link TSConstructor Type
	hi default link TSNamespace PreProc
	hi default link TSSymbol PreProc
	hi default link TSKeyword Repeat
	hi default link TSVariableBuiltin Boolean
]], false)
