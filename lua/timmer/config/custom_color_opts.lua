-- g.t_co = 256
-- vim.g.background = 'dark'

-- Zenburn options
-- set highlight groups right after colorscheme to avoid clear
vim.cmd([[highlight CursorLine guibg=#584848]])
vim.cmd([[highlight visual guibg=#606078]])
vim.cmd([[highlight Search guibg=#a06040]])
vim.cmd([[highlight incsearch guibg=#808060]])

-- Other options
-- Transparent background
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })

-- Fixes for floating windows (ugly pink)
-- vim.api.nvim_set_hl(0, 'FloatBorder', {bg='#3B4252', fg='#5E81AC'})
-- vim.api.nvim_set_hl(0, 'NormalFloat', {bg='#3B4252'})
-- vim.api.nvim_set_hl(0, 'TelescopeNormal', {bg='#3B4252'})
-- vim.api.nvim_set_hl(0, 'TelescopeBorder', {bg='#3B4252'})
