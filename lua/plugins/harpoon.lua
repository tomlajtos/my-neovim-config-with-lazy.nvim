local Plugin = { 'theprimeagen/harpoon' }

Plugin.name = 'harpoon'
Plugin.dependencies = {
	{ 'nvim-lua/plenary.nvim' },
}

function Plugin.init()
	local mark = require("harpoon.mark")
	local ui = require("harpoon.ui")

	vim.keymap.set("n", "<leader>a", mark.add_file)
	vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

	vim.keymap.set("n", "<C-a><C-a>", function() ui.nav_file(1) end)
	vim.keymap.set("n", "<C-s><C-s>", function() ui.nav_file(2) end)
	vim.keymap.set("n", "<C-d><C-d>", function() ui.nav_file(3) end)
	vim.keymap.set("n", "<C-f><C-f>", function() ui.nav_file(4) end)
	vim.keymap.set("n", "<C-g><C-g>", function() ui.nav_file(5) end)
	vim.keymap.set("n", "<C-h><C-h>", function() ui.nav_file(6) end)
 end

return Plugin

