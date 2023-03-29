local Plugin = {'nvim-lualine/lualine.nvim'}

Plugin.name = 'lualine'

Plugin.event = 'VeryLazy'

-- See :help lualine.txt
Plugin.opts = {
  options = {
    theme = 'auto',
    icons_enabled = true,
    -- component_separators = '|',
			component_separators = { left = '', right = '' },
    -- section_separators = '',
			section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {'NvimTree'},
				winbar = {},
    }
  },
}

function Plugin.init()
  vim.opt.showmode = false
end

return Plugin
