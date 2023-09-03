require('gitsigns').setup({
    signs = {
        add = {text = '▎'},
        change = {text = '▎'},
        delete = {text = '➤'},
        topdelete = {text = '➤'},
        changedelete = {text = '▎'},
    },
    current_line_blame = true,
})

--Keymaps
vim.keymap.set('n', '<leader>gh', ':Gitsigns next_hunk<CR>')
vim.keymap.set('n', '<leader>gH', ':Gitsigns prev_hunk<CR>')
vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk<CR>')
vim.keymap.set('n', '<leader>gS', ':Gitsigns undo_stage_hunk<CR>')
vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>')
vim.keymap.set('n', '<leader>gb', ':Gitsigns blame_line<CR>')

