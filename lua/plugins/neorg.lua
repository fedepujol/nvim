---@module "lazy"
---@type LazyPluginSpec
return {
	'nvim-neorg/neorg',
	version = '*', -- Pin Neorg to the latest stable release
	dependencies = {
		{ 'benlubas/neorg-interim-ls' },
		{ 'nvim-neorg/neorg-telescope' },
	},
	keys = {
		{ '<leader>ngi', '<CMD>Neorg index<CR>', desc = '[n]eorg [g]o [i]ndex' },
	},
	config = function()
		require('neorg').setup({
			load = {
				['core.defaults'] = {},
				['core.summary'] = {},
				['core.integrations.telescope'] = {},
				['core.keybinds'] = {
					config = {
						default_keybinds = false,
					},
				},
				['core.concealer'] = {
					config = {
						folds = false,
					},
				},
				['core.dirman'] = {
					config = {
						workspaces = {
							pages = vim.fn.expand('~/sid/vault/pages/'),
						},
						default_workspace = 'pages',
					},
				},
				['core.journal'] = {
					config = {
						journal_folder = vim.fn.expand('~/sid/vault/journals'),
						strategy = 'flat',
					},
				},
				['core.completion'] = {
					config = {
						engine = {
							module_name = 'external.lsp-completion',
						},
					},
				},
				['external.interim-ls'] = {
					config = {
						completion_provider = {
							categories = true,
							people = {
								enable = true,
							},
						},
					},
				},
				['core.highlights'] = {
					config = {
						dim = {
							tags = {
								ranged_verbatim = {
									code_block = {
										reference = 'Normal',
										percentage = -50,
										affect = 'background',
									},
								},
							},

							markup = {
								verbatim = {
									reference = 'Normal',
									percentage = -50,
									affect = 'background',
								},

								inline_comment = {
									reference = 'Normal',
									percentage = -50,
									affect = 'background',
								},
							},
						},
						highlights = {
							tags = {
								-- Highlights for the `@` verbatim tags.
								ranged_verbatim = {
									name = {
										delimiter = '+@Delimiter',
										word = 'guifg=#D38AEA gui=bold',
									},
									parameters = 'guifg=#63AC53',
								},

								-- Highlights for the carryover (`#`, `+`) tags.
								carryover = {
									parameters = 'guifg=#92C587',
								},
							},

							-- In case of errors in the syntax tree, use the following highlight.
							error = 'guifg=#FB4934 gui=undercurl',

							-- Headings
							headings = {
								['1'] = {
									title = 'guifg=#FAB285 guibg=#453830',
									prefix = 'guifg=#FAB387',
								},
								['2'] = {
									title = 'guifg=#FF8800 guibg=#372F25',
									prefix = 'guifg=#FF8800',
								},
								['3'] = {
									title = 'guifg=#9E7AD6 guibg=#34303B',
									prefix = 'guifg=#9E7AD6',
								},
								['4'] = {
									title = 'guifg=#79915F guibg=#2B2D2A',
									prefix = 'guifg=#79915F',
								},
								['5'] = {
									title = 'guifg=#4CB5BD guibg=#2A3132',
									prefix = 'guifg=#4CB5BD',
								},
								['6'] = {
									title = 'guifg=#68B1E8 guibg=#2E373E',
									prefix = 'guifg=#68B1E8',
								},
							},

							-- Quotes
							quotes = {
								['1'] = {
									content = 'guifg=#FAB285 guibg=#453830',
									prefix = 'guifg=#FAB387',
								},
								['2'] = {
									content = 'guifg=#FF8800 guibg=#372F25',
									prefix = 'guifg=#FF8800',
								},
								['3'] = {
									content = 'guifg=#9E7AD6 guibg=#34303B',
									prefix = 'guifg=#9E7AD6',
								},
								['4'] = {
									content = 'guifg=#79915F guibg=#2B2D2A',
									prefix = 'guifg=#79915F',
								},
								['5'] = {
									content = 'guifg=#4CB5BD guibg=#2A3132',
									prefix = 'guifg=#4CB5BD',
								},
								['6'] = {
									content = 'guifg=#68B1E8 guibg=#2E373E',
									prefix = 'guifg=#68B1E8',
								},
							},

							-- TODO items
							todo_items = {
								cancelled = 'guifg=#FF6D62',
								done = 'guifg=#AFD700"',
								on_hold = 'guifg=#2D4F67',
								pending = 'guifg=#67B0E8',
								urgent = 'guifg=#EEB4AE',
							},

							-- Anchor syntax: `[name]{location}`
							anchors = {
								declaration = {
									delimiter = '+@Delimiter',
								},
								definition = {
									delimiter = '+@Delimiter',
								},
							},
							links = {
								description = {
									delimiter = '+@Delimiter',
								},
								file = {
									delimiter = '+@Delimiter',
								},
								location = {
									delimiter = '+@Delimiter',
								},
							},

							-- Inline markup
							markup = {
								bold = {
									delimiter = '+@Delimiter',
								},
								italic = {
									delimiter = '+@Delimiter',
								},
								underline = {
									delimiter = '+@Delimiter',
								},
								strikethrough = {
									delimiter = '+@Delimiter',
								},
								spoiler = {
									delimiter = '+@Delimiter',
								},
								subscript = {
									delimiter = '+@Delimiter',
								},
								superscript = {
									delimiter = '+@Delimiter',
								},
								variable = {
									[''] = 'guifg=#A6DBFF',
									delimiter = '+@Delimiter',
								},
								verbatim = {
									[''] = 'guifg=#ACCF77 guibg=#2A2C3',
									delimiter = '+@Delimiter',
								},
								inline_comment = {
									delimiter = '+@Delimiter',
								},
								inline_math = {
									delimiter = '+@Delimiter',
								},
								free_form_delimiter = '+@Delimiter',
							},

							-- All types of delimiters
							delimiters = {
								strong = 'guifg=#BDC3C2 gui=bold',
							},

							-- All modifiers
							modifiers = {
								link = 'guifg=#2D4F67',
							},
						},
					},
				},
			},
		})

		vim.wo.conceallevel = 2
		vim.keymap.set('n', '<CR>', '<plug>(neorg.esupports.hop.hop-link)')
		vim.keymap.set(
			'n',
			'<leader>nn',
			'<plug>(neorg.dirman.new-note)',
			{ desc = '[n]eorg [n]ew' }
		)
	end,
}
