local Plugin = { "theprimeagen/harpoon" }
-- Plugin.name = 'harpoon'
Plugin.dependencies = {
	{ "nvim-lua/plenary.nvim" },
}

function Plugin.init()
	local mark = require("harpoon.mark")
	local ui = require("harpoon.ui")
	local map = require("user/keymaps").map

	map("n", "<C-e>", ui.toggle_quick_menu, "toggle quick nav-menu", Plugin.name)
	map("n", "<leader>a", mark.add_file, "[a]dd file to quick nav-menu", Plugin.name)
	map("n", "<leader>1", function() ui.nav_file(1) end, "[a]dd file to menu, i-1", Plugin.name)
	map("n", "<leader>2", function() ui.nav_file(2) end, "[a]dd file to menu, i-2", Plugin.name)
	map("n", "<leader>3", function() ui.nav_file(3) end, "[a]dd file to menu, i-3", Plugin.name)
	map("n", "<leader>4", function() ui.nav_file(4) end, "[a]dd file to menu, i-4", Plugin.name)
	map("n", "<leader>5", function() ui.nav_file(5) end, "[a]dd file to menu, i-5", Plugin.name)
	map("n", "<leader>6", function() ui.nav_file(6) end, "[a]dd file to menu, i-6", Plugin.name)
end

return Plugin
