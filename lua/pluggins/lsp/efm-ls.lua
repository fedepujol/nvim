-- EFM LSP
-- go get github.com/mattn/efm-language
local markdownPandoc = {
	formatCommand = 'pandoc -f markdown -t gfm -sp --tab-stop=4'
}

local html = {
	formatCommand = './node_modules/.bin/prettier ${--tab-width:tabWidth} ${--single-quote:singleQuote} --parser html'
}

local css = {
	formatCommand = './node_modules/.bin/prettier ${--tab-width:tabWidth} ${--single-quote:singleQuote} --parser css'
}

local json = {
	formatCommand = './node_modules/.bin/prettier ${--tab-width:tabWidth} --parser json'
}

local lua = {
	formatCommand = 'lua-format -i',
	formatStdin = true,
}

require('lspconfig').efm.setup{
	init_options = {
		documentFormatting = true,
		hover = true,
		documentSymbol = true,
		codeAction = true,
	},
	settings = {
		rootMarkers = {".git/"},
		languages = {
			css = css,
			html = html,
			json = json,
			lua = lua,
			markdown = markdownPandoc,
		}
	}
}
