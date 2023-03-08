local Plugin = { 'mbbill/undotree' }

Plugin.name = 'undotree'

function Plugin.init()
	vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
end

return Plugin
