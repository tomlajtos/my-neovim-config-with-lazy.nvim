local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

load('user.settings')
load('user.commands')
load('user.keymaps')
load('user.plugins')
load('user.colors')

pcall(vim.cmd.colorscheme, 'onedark')
-- vim.cmd.colorscheme('onedark')
-- set_onedark()
