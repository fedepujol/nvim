local pses = require('common-utils').mason
	.. '/packages/powershell-editor-services/PowerShellEditorServices'

---@class vim.lsp.Config
return {
	cmd = {
		'powershell',
		'-NoLogo',
		'-NoProfile',
		'-Command',
		pses .. '/Start-EditorServices.ps1',
		'-BundledModulesPath',
		pses,
		'-LogPath',
		pses .. '/log/pwsh.log',
		'-SessionDetailsPath',
		pses .. '/session.json',
		'-FeatureFlags',
		'@()',
		'-AdditionalModules',
		'@()',
		'-HostName',
		'nvim',
		'-HostProfileId',
		'0',
		'-HostVersion',
		'1.0.0',
		'-Stdio',
		'-LogLevel',
		'Normal',
	},
	shell = 'powershell',
	bundle_path = pses,
}
