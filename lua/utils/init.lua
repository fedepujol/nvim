---@class JdtlsPaths 
---@field config_sys string
---@field jar string
---@field jdk table
---@field project string

---@class JavaUtils
---@field home string?
---@field data any
---@field workspace string
---@field mason string
---@field jdtls string
---@field jdtlsPaths JdtlsPaths

---@class JavaUtils
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
M.workspace = M.home .. '/sid'
M.scoop = M.home .. '/scoop'
M.mason = M.data .. '/mason'
M.jdtls = M.mason .. '/packages/jdtls'

M.jdtlsPaths = {
	config_sys = M.jdtls .. '/' .. selectConfig(),
	jar = vim.fn.glob(M.jdtls .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
	jdk = {
		v8 = M.scoop .. '/apps/corretto8-jdk/current',
		v11 = M.scoop .. '/apps/openjdk11/current',
		v17 = M.scoop .. '/apps/openjdk17/current',
		v21 = M.scoop .. '/apps/openjdk21/current',
	},
	project = M.workspace .. '/java/' .. project_name,
}

return M
