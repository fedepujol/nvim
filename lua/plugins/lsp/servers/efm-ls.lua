-- EFM LSP
-- go get github.com/mattn/efm-language
local lsp = require('plugins.lsp.config')

require('lspconfig').efm.setup{
	cmd = { lsp.dir.."/efm/efm-langserver" },
	init_options = { documentFormatting = true },
	settings = {
		rootMarkers = {'.git/', 'package.json'},
		languages = {
			css = {
				{ formatCommand = "js-beautify -t -n -N -m 0 -f - --type css", formatStdin = true }
			},
			html = {
				{ formatCommand = "js-beautify -t -w 120 -n -I -m 1 -f - --type html", formatStdin = true }
			},
			json = {
				{ formatCommand = "prettier --use-tabs -tab-width=4 --stdin-filepath ${INPUT}", formatStdin = true }
			},
			lua = {
				{ formatCommand = "lua-format -i", formatStdin = true}
			},
			markdown = {
				{ formatCommand = "pandoc -f markdown -t gfm -sp --tab-stop=4", formatStdin = true }
			},
			yaml = {
				{ formatCommand = "prettier --use-tabs --tab-width=4 --stdin-filepath ${INPUT}", formatStdin = true }
			}
		},
	},
	filetypes = {'css', 'html', 'json', 'lua', 'markdown', 'yaml'},
}
