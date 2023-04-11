local M = {}
local light_cs_styles = { "light", "day", "dawn", "dayfox", "dawnfox" }
local hl_groups = {
	'Normal', 'NormalNC', 'NormalFloat', 'FloatBorder', 'FloatTitle', 'LineNr', 'NonText', 'SignColumn', 'CursorLineNr',
	'EndOfBuffer', 'MsgArea', --[[ 'Todo' ]]
}

-- Set colorscheme
M.set_cs = function(tbl, cs)
	if vim.g.cs_loaded then
		if cs == vim.g.colors_name then
			pcall(tbl[cs])
		elseif string.find(cs, "fox") and string.find(vim.g.colors_name, "fox") then
			cs = "nightfox"
			vim.g.curr_cs_style = vim.g.colors_name
			pcall(tbl[cs])
		else
			vim.cmd('hi clear')
			pcall(tbl[cs])
		end
	else
		pcall(tbl[cs])
	end

	if vim.g.transp_cs_bg then M.disable_bg() end

	vim.g.cs_loaded = true
	vim.cmd.ColorschemeInfo()
end

-- Set colorscheme style
M.set_cs_style = function(style_list)
	local style

	if not vim.g.cs_loaded then
		if M.get_style_index(style_list, vim.g.curr_cs_style) > 0 then
			style = vim.g.curr_cs_style
		else
			style = style_list[1]
			vim.g.curr_cs_style = style
		end
	else
		if vim.g.curr_cs == vim.g.colors_name then
			if vim.g.reload_cs then
				style = vim.g.curr_cs_style
				vim.g.reload_cs = false
			else
				style = M.toggle_style(style_list)
				vim.g.curr_cs_style = style
			end
		else
			style = style_list[1]
			vim.g.curr_cs_style = style
		end
	end

	M.set_bg_brightness(style)
	return style
end

-- Set background to 'light' or 'dark' based on the colorscheme style
-- this makes sure that global background option matches the current style
M.set_bg_brightness = function(style)
	if M.get_style_index(light_cs_styles, style) > 0 and not string.find(style, "fox") then
		vim.o.background = 'light'
	else
		vim.o.background = 'dark'
	end
end

-- Get the index of specific style in style list
M.get_style_index = function(tbl, val)
	for i, v in ipairs(tbl) do
		if v == val then
			return i
		end
	end
	return 0
end

-- Toggle the style of a colorscheme based on the available styles (style list in colorscheme config)
-- used in place of the colorscheme's internal toggle function if exeist
M.toggle_style = function(style_list)
	local style = vim.g.curr_cs_style
	local style_index = M.get_style_index(style_list, style)
	local index = style_index + 1

	if index > #style_list then index = 1 end

	style = style_list[index]
	return style
end

-- Reload colorscheme and style
M.reload_cs = function(c_tbl, cs)
	vim.g.reload_cs = true
	if string.find(cs, "fox") and string.find(vim.g.colors_name, "fox") then
		cs = "nightfox"
		vim.g.curr_cs_style = vim.g.colors_name
		pcall(c_tbl[cs])
	else
		pcall(c_tbl[cs])
	end
end

-- Disable background transparency
M.disable_bg = function()
	for _, v in pairs(hl_groups) do
		vim.api.nvim_set_hl(0, v, { bg = "none" })
	end
end

-- Toggle background transparency
M.tggl_transparency = function(c_tbl, cs)
	if vim.api.nvim_get_hl(0, { name = 'Normal' }).bg then
		vim.g.transp_cs_bg = true
		M.disable_bg()
	else
		vim.g.transp_cs_bg = false
		M.reload_cs(c_tbl, cs)
	end
end

return M
