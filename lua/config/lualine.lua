require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        -- theme = 'zenburn',
        -- component_separators = { left = '', right = ''},
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        symbols = {
            -- modified =  ' ',
            -- readonly = ' ',
            -- error = 'E', 
            -- warn = 'W',
            -- info = 'I', 
            -- hint = 'H'
            error = ' ',
            warn = ' ',
            info = ' ',
            hint = ' ',
        },
        show_filename_only = false,
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {
            {
                'mode',
                icon = {
                    '',
                    align='left',
                    -- color={fg='green'}
                }
            }
        },
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
            {'filetype', icon_only = true},
            {
                'filename',
                path = 1,
                symbols = {
                    modified =  ' ',
                    readonly = ' ',
                }
            },
        },
        lualine_x = {'fileformat', 'encoding', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {
        lualine_a = {
            {'filetype', icon_only = true},
            {
                'filename',
                symbols = {
                    modified =  ' ',
                    readonly = ' ',
                }
            },
        }
    },
    inactive_winbar = {
        lualine_a = {
            {'filetype', icon_only = true},
            {
                'filename',
                symbols = {
                    modified =  ' ',
                    readonly = ' ',
                }
            },
        }
    },
    extensions = {}
})

