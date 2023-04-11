local M = {}

-- basic kaymap module
M.map = function(mode, lhs, rhs, desc, plugin)
	-- function M.setkey(mode, lhs, rhs, desc, plugin)
	if plugin then
		desc = plugin .. ": " .. desc
	end
	vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

return M

