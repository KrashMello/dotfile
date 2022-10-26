local cmd = vim.cmd
local g = vim.g
local opt = vim.opt
cmd("autocmd!")


g.mapleader = " "

opt.encoding = 'utf8'
opt.fileencoding = 'utf8'

vim.wo.number = true

opt.title = true

opt.autoindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 2
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10
opt.shell = 'zsh'
opt.backupskip = '/tmp/*,/private/tmp/*'
opt.inccommand = 'split'
opt.ignorecase = true
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.updatetime = 300
opt.writebackup = false
opt.signcolumn = "yes"
opt.ai = true -- Auto indent
opt.si = true -- Smart indent
opt.wrap = false -- No wrap lines
-- opt.backspace = 'start,oel,indent'
opt.path:append { '**' } -- Finding file - Search down into subfolder
opt.wildignore:append { '*/node_modules/*' }
-- Turn off paste mode when leaving insert
--
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = '*',
    command = 'set nopaste'
})

-- Add asterick in block comments
opt.formatoptions:append { 'r' }
