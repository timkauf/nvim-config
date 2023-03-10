require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        group_empty = true,
        icons = {
            show = {
                -- folder_arrow = false,
            },
        },
        indent_markers = {
            enable = true,
        },
    },
    update_focused_file = {
        enable = true,
        debounce_delay = 15,
        update_root = false,
        ignore_list = {},
    },
    filters = {
        -- dotfiles = true,
    },
})

-- Keymaps
vim.keymap.set('n', '<leader>tf', [[:NvimTreeFindFileToggle]])
vim.keymap.set('n', '<leader>tc', [[:NvimTreeCollapse]])
