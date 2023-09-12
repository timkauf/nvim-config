require('bufferline').setup({
    options = {
        indicator = {
            icon = '',
            style = 'none',
        },
        color_icons = true,
        show_close_icon = true,
        show_buffer_close_icons = true,
        show_buffer_icons = true,
        -- show_buffer_default_icon = true,
        tab_size = 0,
        max_name_length = 25,
        offsets = {
            {
                filetype = 'NvimTree',
                text = '  Neoim',
                highlight = 'BufferLineTab',
                text_align = 'left',
            },
        },
        separator_style = 'thin',
        modified_icon = '',
        -- custom_areas = {
        --     left = function()
        --         return {
        --             {
        --                 text = '    ',
        --                 -- fg = '#8fff6d',
        --             },
        --         }
        --     end,
        -- },
    },
})

--Keymaps
vim.keymap.set('n', '<leader>bb', [[<cmd>BufferLinePick<CR>]])
vim.keymap.set('n', '<leader>bc', [[<cmd>BufferLinePickClose<CR>]])
vim.keymap.set('n', '<leader>bl', [[<cmd>BufferLineCycleNext<CR>]])
vim.keymap.set('n', '<leader>bh', [[<cmd>BufferLineCyclePrev<CR>]])
vim.keymap.set('n', '<leader>b=', [[<cmd>BufferLineMoveNext<CR>]])
vim.keymap.set('n', '<leader>b-', [[<cmd>BufferLineMovePrev<CR>]])

