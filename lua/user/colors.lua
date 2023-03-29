-- SET colorscheme to 'onedark'
-- @param style, str: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
function set_onedark(style)
	style = style or "deep"

	require('onedark').setup({
		disable_background = true,
		style = style,
		transparent = true,
		diagnostics = {
			darker = true,
			undercurl = true,
			background = true,
		},
		-- toggle theme style ---
		toggle_style_key = '<F9>', --Leave it nil to disable it, or set it to a string, for example "<leader>ts"
		toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' },
	})
	vim.cmd.colorscheme('onedark')
end

-- SET colorscheme to 'tokyonight'
-- @param style, str: 'night', 'dusk', 'moon', 'day'
function set_tokyo(style)
	style = style or "night"

	require('tokyonight').setup({
		style = 'night',
		terminal_colors = true,
		transparent = true,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
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

vim.keymap.set("n", "<F10>", function() toggle_transparency() end)
vim.keymap.set("n", "<F11>", function() set_tokyo("night") end)
vim.keymap.set("n", "<F12>", function() set_onedark("darker") end)

set_onedark()
