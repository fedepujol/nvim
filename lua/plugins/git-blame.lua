return {
	"f-person/git-blame.nvim",
	event = "VeryLazy",
	opts = {
		enabled = true, -- if you want to enable the plugin
		message_template = " <author> • <date> • <sha>", -- template for the blame message, check the Message template section for more options
		date_format = "%r", -- template for the date, check Date format section for more options
		display_virtual_text = 0, -- Not recommened for statusline
		max_commit_summary_length = 30,
	},
}
