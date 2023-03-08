local Plugin = { 'nvim-telescope/telescope.nvim' }

Plugin.branch = '0.1.x'

Plugin.dependencies = {
	{ 'nvim-lua/plenary.nvim' },
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}

Plugin.cmd = { 'Telescope' }

Plugin.opts = {
	defaults = {
		mappings = {
			i = {
					['<C-u>'] = false,
					['<C-d>'] = false,
			},
		},
	},
}

function Plugin.init()
	-- See :help telescope.builtin
	vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>', { desc = '[?] Find recently opened files' })
	vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>', { desc = '[ ] Find existing buffers' })
	vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>',
		{ desc = '[/] Fuzzily search in current buffer' })

	vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = '[F]ind [F]iles' })
	vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = '[F]ind by [G]rep' })
	vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = '[F]ind [D]iagnostics' })
	vim.keymap.set('n', '<leader>km', '<cmd>Telescope keymaps<cr>', { desc = '[K]ey [M]aps' })
	vim.keymap.set('n', '<leader>vh', '<cmd>Telescope help_tags<cr>', { desc = '[V]iew [H]elp' })
end

function Plugin.config()
	require('telescope').load_extension('fzf')
end

return Plugin
