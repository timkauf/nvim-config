require('dashboard').setup {
    theme = 'hyper',
    config = {
        header = {
         ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
         ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
         ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
         ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
         ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
         ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
        },
        -- center = {},
        -- shortcut = {},
        -- footer = {},
    },
    -- hide = {
    --   statusline = true,
    --   tabline = true,
    --   winbar = true,
    -- },
    -- preview = {
    --   command,
    --   file_path,
    --   file_height,
    --   file_width,
    -- },
}


-- Key mappings
vim.keymap.set('n', '<Leader>db', ':Dashboard<CR>)')
