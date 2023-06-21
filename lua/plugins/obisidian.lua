return {
	'epwalsh/obsidian.nvim',
	event = { "BufReadPre " .. vim.fn.expand("~") .. "/sid/vault/**.md" },
	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'hrsh7th/nvim-cmp' },
		{ 'nvim-telescope/telescope.nvim' }
	},
	opts = {
		dir = "~/sid/vault",
		completion = {
			nvim_cmp = true
		},
		finder = "telescope.nvim"
	},
	config = function(_, opts)
		require('obsidian').setup(opts)
	end
}
