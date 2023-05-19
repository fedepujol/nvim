local M = {}

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local os_names = {
	["Windows"] = "windows",
	["Linux"] = "linux",
}

---Returns the name of the OS
local function homepath()
	local home = nil

	if jit and jit.os then
		local name = os_names[jit.os] or 'unknown'
		if name ~= nil and name ~= 'unknown' then
			if name == 'linux' then
				home = '' .. os.getenv('HOME')
			else
				home = os.getenv('USERPROFILE')
			end
		end
	end

	return home
end

local function selectConfig()
	local name = os_names[jit.os]
	local sys = nil

	if name ~= nil then
		if name == 'windows' then
			sys = 'config_win'
		else
			sys = 'config_linux'
		end
	end
	return sys
end

M.home = homepath()
M.data = vim.fn.stdpath('data')
M.workspace = M.home .. '/Workspace'
M.mason = M.data .. '/mason'
M.jdtls = M.mason .. '/packages/jdtls'

---@return table
M.jdtlsPaths = function()
	return {
		config_sys = M.jdtls .. '/' .. selectConfig(),
		jar = vim.fn.glob(M.jdtls .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
		jdk = M.workspace .. '/tools/java/jdk-17.0.6',
		project = M.workspace .. '/java/' .. project_name,
	}
end

return M