-- set default colorscheme
vim.cmd.colorscheme('onedark')
local map = require("user.utils").map
local toggle_style = require("user.utils").toggle_style
local toggle_transparency = require("user.utils").toggle_transparency

-- SET colorscheme to 'onedark'
-- toggle option same keymap that sets the colorscheme will togle a new theme every time
-- replaces ondark's own toggle function, works with other colorschemes better thisway
-- @param style, str: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
local set_onedark = function()
	local style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }
	local style = toggle_style("onedark", style_list)

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
local set_tokyo = function ()
	local style_list = { 'night', 'moon', 'dusk', 'day', }
	local style = toggle_style("tokyonight", style_list)
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

-- set keymaps with map(mode, lhs, rhs, desc, plugin*) *optional
map("n", "<c-F9>", function() toggle_transparency() end, "toggle bg transparency")
map("n", "<F10>", function() vim.cmd.colorscheme('kanagawa') end, "Set 'kanagawa'", "Colorscheme")
map("n", "<F11>", function() set_tokyo() end, "Set 'tokyonight'", "Colorscheme")
map("n", "<F12>", function() set_onedark() end, "Set 'onedark'", "Colorscheme")

