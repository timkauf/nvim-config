local opt = vim.opt

-- System Clipboard
opt.clipboard = 'unnamedplus'

-- Margin columns
-- opt.colorcolumn = '80'
opt.number = true
-- opt.relativenumber = true
opt.signcolumn = "yes:2"
-- opt.statuscolumn = "%s %l %r"

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Filetypes
opt.encoding = 'utf8'
opt.fileencoding = 'utf8'

-- Theme
opt.syntax = "ON"
opt.termguicolors = true
opt.cursorline = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Whitespace
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.smartindent = true
opt.wrap = true
opt.breakindent = true  --Wrapped lines preserve indentation
opt.linebreak = true

opt.list = true  -- enable the below listchars
opt.listchars = {
    tab = '> ',
    trail = '·',
    nbsp = '+',
}

opt.fillchars:append({ eob = ' ' })  -- remove the ~ from end of buffer

-- Special modes
opt.wildmode = 'longest:full,full'  -- complete the longest match, and allow tabbing the results to fully complete them
opt.completeopt = 'menuone,longest,preview'  -- Show menu even if only one item, etc
opt.mouse = 'a'  -- enable mouse for all modes

-- Helpers
opt.spell = false

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Saving
opt.swapfile = false
opt.backup = true  -- auto backup
opt.backupdir:remove('.')  -- keep backups out of current dir (default should be hidden dir in home dir)
opt.confirm = true  -- when you quit before saving, ask for confirmation instead of erroring
opt.undofile = true  -- persistent undo

-- Update the packpath
local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path
