vim.cmd("set softtabstop=0")
vim.cmd("set noexpandtab")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.diagnostic.config({ virtual_text = true })
vim.g.have_nerd_font = true

-- clipboard yanking
vim.keymap.set({ 'n', 'v' }, '<leader>y', '\"+y', { desc = 'Yank to clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '\"+p', { desc = 'Paste from clipboard' })

-- windows stuff
if vim.fn.has("win32") == 1 then
	vim.o.shell = vim.fn.executable('pwsh') == 1 and 'pwsh' or 'powershell'
end
