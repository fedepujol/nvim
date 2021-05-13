-- EFM LSP
-- go get github.com/mattn/efm-language
local markdownPandoc = {
	formatCommand = 'pandoc -f markdown -t gfm -sp --tab-stop=4'
}

local prettier = "~/node_modules/.bin/prettier --parser"

require('lspconfig').efm.setup{
	cmd = { "~/go/bin/efm-langserver" },
	init_options = {
		documentFormatting = true,
	},
	filetypes = {'css', 'html', 'json', 'markdown'},
	settings = {
		rootMarkers = {".git/"},
		languages = {
			css = { formatCommand = prettier..' css' },
			html = { formatCommand = prettier..' html' },
			json = { formatCommand = prettier..' json' },
			markdown = markdownPandoc,
		}
	}
}
