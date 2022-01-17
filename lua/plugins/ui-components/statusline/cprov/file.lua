local M = {}

M.position = function()
	return ' '..string.format('%02d.%02d', unpack(vim.api.nvim_win_get_cursor(0)))..' '
end

-- Doesn't work with feline
M.percentage = function()
	local cL = vim.fn.line('.')
	local tL = vim.fn.line('$')

	if cL == 1 then
		return " Top "
	elseif cL == tL then
		return " Bot "
	end

	local result, _ = math.modf((cL / tL) * 100)

	return ' '..string.format('%02d', result)..'%%'
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

	local res = ' ('..string.format('%d', lsps)..') '
	return lsp_name == '' and res or res..lsp_name..' '
end

return M
