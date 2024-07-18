-- Package-info.nvim
-- NPM functions for package.json
--
return {
	'vuki656/package-info.nvim',
	dependencies = {
		'MunifTanjim/nui.nvim',
	},
	ft = 'json',
	config = function()
		require('package-info').setup({
			colors = {
				up_to_date = '#3C4048', -- Text color for up to date dependency virtual text
				outdated = '#d19a66', -- Text color for outdated dependency virtual text
			},
			icons = {
				enable = true, -- Whether to display icons
				style = {
					up_to_date = '|  ', -- Icon for up to date dependencies
					outdated = '|  ', -- Icon for outdated dependencies
				},
			},
			autostart = false, -- Whether to autostart when `package.json` is opened
			hide_up_to_date = true, -- It hides up to date versions when displaying virtual text
			hide_unstable_versions = false, -- It hides unstable versions from version list e.g next-11.1.3-canary3
			package_manager = 'npm',
		})

		local wk = require('which-key')
		wk.add({
			{ '<leader>p', group = 'PackageInfo' },
			{ '<leader>pc', ':PackageInfoChangeVersion<CR>', desc = 'Change version' },
			{ '<leader>pd', ':PackageInfoDelete<CR>', desc = 'Delete dependency' },
			{ '<leader>ph', ':PackageInfoHide<CR>', desc = 'Hide versions' },
			{ '<leader>pi', ':PackageInfoInstall<CR>', desc = 'Install new dependency' },
			{ '<leader>ps', ':PackageInfoShow<CR>', desc = 'Show versions' },
			{ '<leader>pu', ':PackageInfoUpdate<CR>', desc = 'Update dependency' },
		})
	end,
}
