-- UndoTree

return {
	'mbbill/undotree',
	cmd = "UndotreeToggle",
	config = function ()
		-- Layout
		vim.g.undotree_WindowLayout = 3

		-- Use 'd' instead of 'days' to save space
		vim.g.undotree_ShortIndicators = 1

		-- Autofocus Undotree when open
		vim.g.undotree_SetFocusWhenToggle = 1

		-- UI
		-- Node shape
		vim.g.undotree_TreeNodeShape = "●"
		-- Vertical shape
		vim.g.undotree_TreeVertShape = "│"
		-- Split shape
		vim.g.undotree_TreeSplitShape = "/"
		-- Return shape
		vim.g.undotree_TreeReturnShape = "\\"
	end
}
