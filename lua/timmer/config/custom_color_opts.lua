-- g.t_co = 256
-- vim.g.background = 'dark'

-- set highlight groups right after colorscheme to avoid clear
vim.cmd([[highlight CursorLine guibg=#605050]])
vim.cmd([[highlight Search guibg=#606040]])
vim.cmd([[highlight IncSearch guibg=#a0a040]])
vim.cmd([[highlight Visual guibg=#605050]])

-- Transparent background
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })

-- Fixes for floating windows (ugly pink)
-- vim.api.nvim_set_hl(0, 'FloatBorder', {bg='#3B4252', fg='#5E81AC'})
-- vim.api.nvim_set_hl(0, 'NormalFloat', {bg='#3B4252'})
-- vim.api.nvim_set_hl(0, 'TelescopeNormal', {bg='#3B4252'})
-- vim.api.nvim_set_hl(0, 'TelescopeBorder', {bg='#3B4252'})
