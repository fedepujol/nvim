local M = {}

local function addPrefix(value, prefix)
	if value < 10 then
		value = prefix..value
	end
	return value
end

M.position = function()
	local l, c = unpack(vim.api.nvim_win_get_cursor(0))
	c = addPrefix(c, '0')
	l = addPrefix(l, '0')
	return l..'.'..c
end

-- Doesn't work with feline
M.porcentage = function()
	local cL = vim.fn.line('.')
	local tL = vim.fn.line('$')

	if cL == 1 then
		return "Top "
	elseif cL == vim.fn.line('$') then
		return "Bot "
	end

	local result, _ = math.modf((cL / tL) * 100)
	result = addPrefix(result, '0')

	return string.format('%d', result)..'%'
end

M.lsp_client = function()
	local lsps = 0
	local lsp_name = ''
	for _, client in pairs(vim.lsp.buf_get_clients(0)) do
		if lsp_name == '' then
			lsp_name = client.name
		end
		lsps = lsps + 1
	end
	return ' ('..string.format('%d', lsps)..') '..lsp_name
end

return M
