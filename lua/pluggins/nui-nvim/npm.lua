local Builder = require('pluggins.nui-nvim.builder')

local npm_cmd = {
	{ cmd = 'npm start', menu = 'Start'},
	{ cmd = 'npm i ', menu = 'Install'},
	{ cmd = 'npm un ', menu = 'Uninstall'},
	{ cmd = 'npm ci', menu = 'Clean Install'}
}

function NpmSupport()
	local builder = Builder:new{ 
		cmds = npm_cmd,
		eval = 'Install',
		title = 'NPM'
	}

	local menu = builder.build_menu()
	menu:mount()
end

local wk = require('which-key')
wk.register({
	r = {
		name = 'Run Commands',
		n = {'<cmd>lua NpmSupport()<CR>', 'NPM Cmds'}
	},
}, { mode = 'n', prefix = '<leader>', noremap = true, silent = true })
