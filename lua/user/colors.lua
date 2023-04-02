-- find the first index with value (@val) in a table
function Get_style_index(tbl, val)
	for i, v in ipairs(tbl) do
		if v == val then
			return i
		end
	end
	return 0 --return 1 insted of nil in case options.style cannot be read
end

-- toggles the style of a colorscheme  based on the available styles
-- provided in form of a style list
-- used in place of the colorscheme's internal toggle function if exeist
function Toggle_style(colors, style_list)
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
	local style_index = Get_style_index(style_list, style)
	local index = style_index + 1

	if index > #style_list then index = 1 end

	style = style_list[index]
-- fixes issue with background style missmatch
	if style == 'light' then vim.o.background = 'light' else vim.o.background = 'dark' end

	return style
end

-- SET colorscheme to 'onedark'
-- toggle option same keymap that sets the colorscheme will togle a new theme every time
-- replaces ondark's own toggle function, works with other colorschemes better thisway
-- @param style, str: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
function Set_onedark()
	local style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }
	local style = Toggle_style("onedark", style_list)

	require('onedark').setup({
		disable_background = true,
		style = style,
		term_colors = true,
	})
	vim.cmd.colorscheme('onedark')
end

-- SET colorscheme to 'tokyonight'
-- toggle option same keymap that sets the colorscheme will togle a new theme every time
-- @param style, str: 'night', 'dusk', 'moon', 'day'
function Set_tokyo()
	local style_list = { 'day', 'night', 'moon', 'dusk' }
	local style = Toggle_style("tokyonight", style_list)
local curr_transp_v = require("tokyonight.config").options.transparent
	require('tokyonight').setup({
		style = style,
		terminal_colors = true,
		transparent = curr_transp_v,
		styles = {
			sidebars = 'transparent',
			floats = 'transparent',
		}
	})
	vim.cmd.colorscheme('tokyonight')
end

-- Toggle background transparency
-- alters colorscheme config
local toggle_transparency = function()
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

vim.keymap.set("n", "<F9>", function() toggle_transparency() end)
vim.keymap.set("n", "<F10>", function() vim.cmd.colorscheme('darkplus') end)
vim.keymap.set("n", "<F11>", function() Set_tokyo() end)
vim.keymap.set("n", "<F12>", function() Set_onedark() end)

Set_onedark()
