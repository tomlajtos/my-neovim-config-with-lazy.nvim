-- Set leader to "<space>"
vim.g.mapleader = ' '

-- Set keymap for nvim default file browser
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open Netrw explorer" })

-- Shortcuts
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>h', '^')
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>l', 'g_')
-- vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- Basic clipboard interaction
-- vim.keymap.set({'n', 'x'}, 'cp', '"+y')
-- vim.keymap.set({'n', 'x'}, 'cv', '"+p')
-- yanked pattern is put in the system clipboard (asbjornHaland)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete text
-- vim.keymap.set({'n', 'x'}, 'x', '"_x')

-- Commands
-- vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')
vim.keymap.set("n", "<leader>w", vim.cmd.write)
vim.keymap.set('n', '<leader>bq', '<cmd>bdelete<cr>')
vim.keymap.set('n', '<leader>bl', '<cmd>buffer #<cr>')
-- Set basic remaps for write/quit/back to normal from insert
vim.keymap.set("n", "<leader>q", vim.cmd.quit)
vim.keymap.set("i", "jj", "<Esc>")
--vim.keymap.set("i", "<C-c>", "<Esc>")


-- Move highlighted lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- take line below and append it to the end of the current line with a space
-- keeps the cursor in the same space as well
vim.keymap.set("n", "J", "mzJ`z")
-- jump half page up/down (c-d/c-u)
-- keeps the cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- jump to next/prev match while keeping the cursor centered on the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- WTF is vim-with-me??? keymaps for that
--vim.keymap.set("n", "<leader>vwm", function()
--    require("vim-with-me").StartVimWithMe()
--end)
--vim.keymap.set("n", "<leader>svwm", function()
--    require("vim-with-me").StopVimWithMe()
--end)

-- preserve current paste buffer whan copying over highlighted pattern
vim.keymap.set("x", "<leader>p", [["_dP]])

-- deleting to void register  so deleted pattern is not preserved
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")

--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- LSP: format buffer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- for quickfix window navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace word under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- make edited shell file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/tomlajtos/packer.lua<CR>");
--vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
