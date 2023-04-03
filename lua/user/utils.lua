local M = {}

-- basic kaymap module
M.map = function(mode, lhs, rhs, desc, plugin)
	-- function M.setkey(mode, lhs, rhs, desc, plugin)
	if plugin then
		desc = plugin .. ": " .. desc
	end
	vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

-- find the first index with value (@val) in a table
M.get_style_index = function(tbl, val)
	for i, v in ipairs(tbl) do
		if v == val then
			return i
		end
	end
	return 0 --return 0 insted of nil in case options.style cannot be read at the time of calling the function
end

-- toggles the style of a colorscheme  based on the available styles
-- provided in form of a style list
-- used in place of the colorscheme's internal toggle function if exeist
M.toggle_style = function(colors, style_list)
	local config_str
	local style
	-- check if right colorscheme and get the current style
	if vim.g.colors_name == colors then
		if colors == 'onedark' then
			style = vim.g.onedark_config.style
		else
			config_str = colors .. ".config"
			style = require(config_str).options.style
		end
	end
	-- get the index of current style and set new style index
	local style_index = M.get_style_index(style_list, style)
	local index = style_index + 1

	if index > #style_list then index = 1 end

	style = style_list[index]
	-- fixes issue with background style missmatch
	if style == 'light' then vim.o.background = 'light' else vim.o.background = 'dark' end

	return style
end

-- Toggle background transparency
-- alters colorscheme config
M.toggle_transparency = function()
	local colorscheme = vim.g.colors_name
	if colorscheme == "onedark" or colorscheme == "tokyonight" then
		if colorscheme == "onedark" then
			BG_transparency = vim.g.onedark_config.transparent
			CS_style = vim.g.onedark_config.style
		elseif colorscheme == "tokyonight" then
			BG_transparency = require("tokyonight.config").options.transparent
			CS_style = require("tokyonight.config").options.style
		end

		if BG_transparency then
			require(colorscheme).setup({
				transparent = false,
				style = CS_style,
			})
		else
			require(colorscheme).setup({
				transparent = true,
			})
		end
		vim.cmd.colorscheme(colorscheme)
	else
		vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
		vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
		vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
		vim.api.nvim_set_hl(0, 'FoatBorder', { bg = 'none' })
		vim.api.nvim_set_hl(0, 'FoatTitle', { bg = 'none' })
		vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
		vim.api.nvim_set_hl(0, 'MsgArea', { bg = 'none' })
		vim.api.nvim_set_hl(0, 'NonText', { bg = 'none' })
	end
end

return M

