-- find the first index with value (@val) in a table
function Get_style_index(tbl, val)
	for i, v in ipairs(tbl) do
		if v == val then
			return i
		end
	end
	return 1 --nil
end

function Toggle_style(colors, style_list)
	local config_str = colors .. ".config"
	print('togglef conf str:', config_str)
	if vim.g.colors_name == colors then
		print('togglef colors arg:', colors)
		style = require(config_str).options.style
		print('toggelf style in if:', style)
		-- else
		-- 	style = default_style
	end
	local style_index = Get_style_index(style_list, style) --or 1
	local index = style_index + 1

	if index > #style_list then index = 1 end

	style = style_list[index]
	print('togglef res:', style)
	return style
end

-- SET colorscheme to 'onedark'
-- @param style, str: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
function set_onedark(style)
	style = style or "darker"
	-- local bg_transparency = vim.g.onedark_config.transparent

	require('onedark').setup({
		disable_background = true,
		style = style,
		term_colors = true,
		transparent = true,
		diagnostics = {
			darker = true,
			undercurl = true,
			background = true,
		},
		-- toggle theme style ---
		toggle_style_key = '<F12>', --Leave it nil to disable it, or set it to a string, for example "<leader>ts"
		toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' },
	})
	vim.cmd.colorscheme('onedark')
end

-- SET colorscheme to 'tokyonight'
-- @param style, str: 'night', 'dusk', 'moon', 'day'
function set_tokyo()
	style_list = { 'night', 'moon', 'dusk', 'day' }
	local style = Toggle_style("tokyonight", style_list)
	print('set_tokyof style:', style)

	local transparent = require("tokyonight.config").options.transparent

	require('tokyonight').setup({
		style = style,
		terminal_colors = true,
		transparent = transparent,
		styles = {
			-- sidebars = transparent,
			-- floats = transparent,
		}
	})

	vim.cmd.colorscheme('tokyonight')
end

-- Toggle background transparency
local toggle_transparency = function()
	local colorscheme = vim.g.colors_name

	if colorscheme == "onedark" then
		bg_transparency = vim.g.onedark_config.transparent
		cs_style = vim.g.onedark_config.style
	elseif colorscheme == "tokyonight" then
		bg_transparency = require("tokyonight.config").options.transparent
		cs_style = require("tokyonight.config").options.style
	end

	if bg_transparency then
		require(colorscheme).setup({
			transparent = false,
			style = cs_style,
		})
	else
		require(colorscheme).setup({
			transparent = true,
		})
	end

	vim.cmd.colorscheme(colorscheme)
end

-- vim.keymap.set("n", "<F9>", function()Toggle_style("tokyonight", { 'night', 'moon', 'dusk', 'day' })
-- vim.keymap.set("n", "<F9>", function()Toggle_style("onedark", { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' })
-- end)
vim.keymap.set("n", "<F10>", function() toggle_transparency() end)
vim.keymap.set("n", "<F11>", function() set_tokyo() end)
-- <F12> sets onedark colorscheme and toggles the different styles

print('colors.lua cs:', vim.g.colors_name)
set_onedark("darker")
