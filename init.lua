local g = vim.g

-- Disable netrw in favor of nvim.tree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Leader
g.mapleader = " "
-- g.maplocalleader = " "
-- g.localleader = "\\"

-- Imports
require('timmer/options')
require('timmer/keymaps')
require('timmer/plugins')
-- require('timmer/reload')  --Debug why hot reload not working

