local Builder = require('pluggins.nui-nvim.builder')

local tbl = {
	angular = {
		eval = function(value)
			return value:find('Component') ~= nil
		end,
		{ cmd = 'ng new ', menu = 'New Project'},
		{ cmd = 'ng init', menu = 'Init'},
		{ cmd = 'ng g component ', menu = 'Generate Component'}
	},
	maven = {
		eval = function(_)
			return false
		end,
		{ cmd = 'mvn clean install', menu = 'Clean Install'},
		{ cmd = 'mvn spring-boot:run', menu = 'Run Spring-boot'}
	},
	npm = {
		eval = function(value)
			return value:find('Install') ~= nil and value:find('Clean') == nil
		end,
		{ cmd = 'npm start', menu = 'Start'},
		{ cmd = 'npm i ', menu = 'Install'},
		{ cmd = 'npm un ', menu = 'Uninstall'},
		{ cmd = 'npm ci', menu = 'Clean Install'}
	}
}

function Cmds()
	local builder = Builder:new({
		cmds = tbl
	})

	local menu = builder.build_menu()
	menu:mount()
end

local wk = require('which-key')
wk.register({
	r = {
		name = 'Run Commands',
		s = {'<cmd>lua Cmds()<CR>', 'Select Cmds'}
	},
}, { mode = 'n', prefix = '<leader>', noremap = true, silent = true })

