---@brief
---
--- https://github.com/angular/vscode-ng-language-service
--- `angular-language-server` can be installed via npm `npm install -g @angular/language-server`.
---
--- ```lua
--- local project_library_path = "/path/to/project/lib"
--- local cmd = {"ngserver", "--stdio", "--tsProbeLocations", project_library_path , "--ngProbeLocations", project_library_path}
---
--- vim.lsp.config('angularls', {
---   cmd = cmd,
--- })
--- ```

-- Angular requires a node_modules directory to probe for @angular/language-service and typescript
-- in order to use your projects configured versions.
local root_dir = vim.fn.getcwd()
local node_modules_dir = vim.fs.find('node_modules', { path = root_dir, upward = true })[1]
local project_root = node_modules_dir and vim.fs.dirname(node_modules_dir) or '?'

---@class CommonUtils
local utils = require('common-utils')

local function get_angular_core_version()
	if not project_root then
		return ''
	end

	local package_json = project_root .. '/package.json'
	if not vim.uv.fs_stat(package_json) then
		return ''
	end

	local contents = io.open(package_json):read('*a')
	local json = vim.json.decode(contents)
	if not json.dependencies then
		return ''
	end

	local angular_core_version = json.dependencies['@angular/core']

	angular_core_version = angular_core_version and angular_core_version:match('%d+%.%d+%.%d+')

	return angular_core_version
end

local default_angular_core_version = get_angular_core_version()

return {
	cmd = {
		'ngserver',
		'--stdio',
		'--tsProbeLocations',
		utils.mason .. '/packages/angularls/node_modules/.bin',
		'--ngProbeLocations',
		utils.mason .. '/packages/angularls/node_modules/.bin',
		default_angular_core_version,
	},
	filetypes = { 'typescript', 'htmlangular' },
	root_markers = { 'angular.json', 'nx.json' },
}
