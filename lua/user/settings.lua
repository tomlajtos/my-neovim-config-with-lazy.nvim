-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = 'a'

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.wrap = true --false

-- Set tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.smartindent = true
-- Enable break indent
vim.opt.breakindent = true

-- Decrease update time
vim.opt.updatetime = 200 --50
vim.opt.signcolumn = 'yes'

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
-- vim.opt.colorcolumn = "90"
-- vim.opt.guicursor = ""

-- Set completeopt to have a better completion experience
-- vim.o.completeopt = 'menuone,noselect'
