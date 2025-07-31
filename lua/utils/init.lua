---@class JdtlsPaths
---@field config_sys string
---@field jar string
---@field jdk table
---@field gradle string
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
	['Windows'] = 'windows',
	['Linux'] = 'linux',
}

M.is_windows = function()
	local result = false
	if jit and jit.os then
		local name = os_names[jit.os] or 'unknown'
		result = name == 'windows' and name ~= 'unknown'
	end

	return result
end

---Returns the name of the OS
local function homepath()
	local home = nil

	local isWin = M.is_windows()
	if isWin then
		home = os.getenv('USERPROFILE')
	else
		home = '' .. os.getenv('HOME')
	end

	return home
end

local function selectConfig()
	local sys = nil

	if M.is_windows() then
		sys = 'config_win'
	else
		sys = 'config_linux'
	end

	return sys
end

M.home = homepath()
M.data = vim.fn.stdpath('data')
M.workspace = M.home .. '/sid'
M.scoop = M.home .. '/scoop/apps'
M.mason = M.data .. '/mason'
M.jdtls = M.mason .. '/packages/jdtls'

M.jdtlsPaths = {
	config_sys = M.jdtls .. '/' .. selectConfig(),
	jar = vim.fn.glob(M.jdtls .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
	jdk = {
		v8 = M.scoop .. '/corretto8-jdk/current',
		v11 = M.scoop .. '/temurin11-jdk/current',
		v17 = M.scoop .. '/corretto-lts-jdk/current',
		v21 = M.scoop .. '/corretto-jdk/current',
	},
	gradle = M.scoop .. '/gradle7/current',
	project = M.workspace .. '/java/' .. project_name,
}

return M
