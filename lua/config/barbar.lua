require('barbar').setup({
    icons = {
        modified = {button = ''},
    },
    sidebar_filetypes = {
        NvimTree = true
    },
})

--Keymaps
vim.keymap.set('n', '<leader>bb', [[<cmd>BufferPick<CR>]])
vim.keymap.set('n', '<leader>bd', [[<cmd>BufferPickDelete<CR>]])
vim.keymap.set('n', '<leader>bl', [[<cmd>BufferNext<CR>]])
vim.keymap.set('n', '<leader>bh', [[<cmd>BufferPrevious<CR>]])
vim.keymap.set('n', '<leader>b=', [[<cmd>BufferMoveNext<CR>]])
vim.keymap.set('n', '<leader>b-', [[<cmd>BufferMovePrevious<CR>]])

