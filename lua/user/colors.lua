vim.cmd(':source ~/.config/nvim/lua/globals/cs_v_globals.lua')

local map = require("user.utils").map
local toggle_transparency = require("user.colors_mod").tggl_transparency
local set_cs = require("user.colors_mod").set_cs
local set_cs_style = require("user.colors_mod").set_cs_style

-- table of functions to SET colorscheme
---- toggle style function is called inside each set_cs-function >> same keymap that sets the colorscheme
---- will togle a new theme every time, replaces the colorscheme's own toggle function, if there's one,
---- this solution works better with multiple colorschemes
---- @param style, str: item in style_list table {'str',...}
local cs_tbl = {}

-- cs_1
cs_tbl["onedark"] = function()
	local style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }
	local style = set_cs_style(style_list)
	-- vim.g.curr_cs_style = style -- not the best here, sets the next as current

	require('onedark').setup({
		style = style,
		disable_background = false,
		term_colors = true,
	})
	vim.g.curr_cs = 'onedark'
	vim.api.nvim_command("colorscheme onedark")
end

-- cs_2
cs_tbl["tokyonight"] = function()
	local style_list = { 'night', 'moon', 'dusk', 'day', }
	local style = set_cs_style(style_list)

	require('tokyonight').setup({
		style = style,
		terminal_colors = true,
		transparent = false,
		styles = {
			sidebars = 'transparent',
			floats = 'transparent',
		}
	})
	vim.g.curr_cs = 'tokyonight'
	vim.cmd.colorscheme('tokyonight')
end

-- cs_3
cs_tbl["nightfox"] = function()
	local style_ls = { 'nightfox', 'dayfox', 'dawnfox', 'duskfox', 'nordfox', 'terafox', 'carbonfox' }
	local style = set_cs_style(style_ls)

	require('nightfox').setup({
		options = {
			transparent = false,
			terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`		}
		}
	})
	vim.g.curr_cs = style
	vim.cmd.colorscheme(style)
end

-- set keymaps with map(mode, lhs, rhs, desc, plugin*) *optional
map("n", "<c-F9>", function() toggle_transparency(cs_tbl, vim.g.curr_cs) end, "toggle bg transparency")
map("n", "<F10>", function() set_cs(cs_tbl, "nightfox") end, "Set 'nightfox'", "Colorscheme")
map("n", "<F11>", function() set_cs(cs_tbl, "tokyonight") end, "Set 'tokyonight'", "Colorscheme")
map("n", "<F12>", function() set_cs(cs_tbl, "onedark") end, "Set 'onedark'", "Colorscheme")

set_cs(cs_tbl, "nightfox")
