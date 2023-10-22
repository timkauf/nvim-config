require('oil').setup({
    options = {}
})

-- Key mappings
vim.api.nvim_set_keymap('n', '<leader>fo', ':Oil<CR>', { noremap = true })

