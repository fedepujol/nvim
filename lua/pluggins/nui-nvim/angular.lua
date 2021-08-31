local Builder = require('pluggins.nui-nvim.builder')

local angular = {
	{ cmd = 'ng new ', menu = 'New Project'},
	{ cmd = 'ng init', menu = 'Init'},
	{ cmd = 'ng g component ', menu = 'Generate Component'}
}

function AngularSupport()
	local builder = Builder:new({
		cmds = angular,
		eval = 'Component',
		title = 'Angular'
	})

	local menu = builder.build_menu()
	menu:mount()
end

local wk = require('which-key')
wk.register({
	r = {
		name = 'Run Commands',
		a = {'<cmd>lua AngularSupport()<CR>', 'Angular Cmds'}
	},
}, { mode = 'n', prefix = '<leader>', noremap = true, silent = true })

