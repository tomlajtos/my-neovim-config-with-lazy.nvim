local Plugin = { 'nvim-treesitter/nvim-treesitter' }

Plugin.dependencies = {
	{ 'nvim-treesitter/nvim-treesitter-textobjects' }
}

-- See :help nvim-treesitter-modules
Plugin.opts = {
	ensure_installed = {
		'bash',
		'c',
		'comment',
		'css',
		'gitcommit',
		'html',
		'javascript',
		'json',
		'lua',
		'python',
		'sql',
		'typescript',
		'tsx',
		'vimdoc',
	},
	auto_install = true,
	sync_install = false,
	highlight = {
		enable = true,
	},
	-- :help nvim-treesitter-textobjects-modules
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			}
		},
	},
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
}

function Plugin.config(name, opts)
	require('nvim-treesitter.configs').setup(opts)
end

return Plugin
