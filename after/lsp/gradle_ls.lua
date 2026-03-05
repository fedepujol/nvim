---@class CommonUtils
local utils = require('common-utils')

---@class vim.lsp.Config
return {
	cmd = {
		'java',
		'-jar',
		utils.mason .. '/packages/gradle-language-server/extension/lib/gradle-language-server.jar',
	},
}
