function JoinTheDarkSide(color)
	require('tokyonight').setup({
		disable_background = true,
		style = 'night',
		light_style = 'day',
		transparent = true,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		}
	})
	color = color or 'tokyonight'

	vim.cmd.colorscheme(color)
end

function LetItShine()
	require('tokyonight').setup({
		-- disable_background = true,
		style = 'night',
		light_style = 'day',
		transparent = false,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		}
	})
	vim.cmd.colorscheme('tokyonight-day')
end

vim.keymap.set("n", "<F11>", function() LetItShine() end)
vim.keymap.set("n", "<F12>", function() JoinTheDarkSide() end)

JoinTheDarkSide()
