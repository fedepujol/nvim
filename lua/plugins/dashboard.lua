return {
	'glepnir/dashboard-nvim',
	event = 'VimEnter',
	dependencies = { { 'nvim-tree/nvim-web-devicons' } },
	opts = function()
		local opts = {
			theme = 'doom',
			config = {
				header = {
					[[                                                   ]],
					[[                                              ___  ]],
					[[                                           ,o88888 ]],
					[[                                        ,o8888888' ]],
					[[                  ,:o:o:oooo.        ,8O88Pd8888"  ]],
					[[              ,.::.::o:ooooOoOoO. ,oO8O8Pd888'"    ]],
					[[            ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"      ]],
					[[           , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"        ]],
					[[          , ..:.::o:ooOoOO8O888O8O,COCOO"          ]],
					[[         , . ..:.::o:ooOoOOOO8OOOOCOCO"            ]],
					[[          . ..:.::o:ooOoOoOO8O8OCCCC"o             ]],
					[[             . ..:.::o:ooooOoCoCCC"o:o             ]],
					[[             . ..:.::o:o:,cooooCo"oo:o:            ]],
					[[          `   . . ..:.:cocoooo"'o:o:::'            ]],
					[[          .`   . ..::ccccoc"'o:o:o:::'             ]],
					[[         :.:.    ,c:cccc"':.:.:.:.:.'              ]],
					[[       ..:.:"'`::::c:"'..:.:.:.:.:.'               ]],
					[[     ...:.'.:.::::"'    . . . . .'                 ]],
					[[    .. . ....:."' `   .  . . ''                    ]],
					[[  . . . ...."'                                     ]],
					[[  .. . ."'                                         ]],
					[[ .                                                 ]],
					[[                                                   ]],
				},
				center = {
					{
						icon = ' ',
						icon_hl = 'String',
						desc = 'Find File',
						desc_hl = 'String',
						key = 'p',
						keymap = 'SPC f',
						key_hl = 'Number',
						action = 'require("telescope.builtin").find_files({previewer = false})',
					},
					{
						icon = ' ',
						icon_hl = 'String',
						desc = 'Help',
						desc_hl = 'String',
						key = 'h',
						keymap = 'SPC f',
						key_hl = 'Number',
						action = 'require("telescope.builtin").help_tags()',
					},
					{
						icon = ' ',
						icon_hl = 'String',
						desc = 'New File',
						desc_hl = 'String',
						key = 'f',
						keymap = 'SPC n',
						key_hl = 'Number',
						action = ':enew',
					},
					{
						icon = ' ',
						icon_hl = 'String',
						desc = 'Terminal',
						desc_hl = 'String',
						key = 't',
						keymap = 'SPC t',
						key_hl = 'Number',
						action = ':ToggleTerm<CR>',
					},
					{
						icon = '󰗼 ',
						icon_hl = 'String',
						desc = 'Quit',
						desc_hl = 'String',
						key = 'q',
						keymap = 'CTRL',
						key_hl = 'Number',
						action = ':qa!',
					},
				},
				footer = {}, --your footer
			},
		}
		return opts
	end,
	config = function(_, opts)
		local db = require('dashboard')
		vim.api.nvim_create_autocmd('User', {
			pattern = 'LazyVimStarted',
			callback = function()
				local stats = require('lazy').stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				local footer = '⚡ Neovim loaded ' .. stats.loaded .. ' plugins in ' .. ms .. 'ms'
				opts.config.footer = { '' .. footer .. '' }
				db.setup(opts)
			end,
		})
	end,
}
