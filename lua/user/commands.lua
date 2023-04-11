local group = vim.api.nvim_create_augroup('user_cmds', { clear = true })

vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

vim.api.nvim_create_user_command('ColorschemeInfo', function()
	print(
		"Colorscheme loaded:", vim.g.cs_loaded, --[[ "\n", ]]
		"> Colorscheme:", vim.g.colors_name, --[[ "\n", ]]
		"> Transparent bg:", vim.g.transp_cs_bg, --[[ "\n", ]]
		"> Current style:", vim.g.curr_cs_style --[[ "\n", ]])
end, {})

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight on yank',
	group = group,
	callback = function()
		vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'help', 'man' },
	group = group,
	command = 'nnoremap <buffer> q <cmd>quit<cr>'
})
