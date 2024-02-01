local telescope = require("telescope")
-- local actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")

-- Highlights...not working
-- vim.cmd([[
--     highlight link TelescopePromptTitle PMenuSel
--     highlight link TelescopePreviewTitle PMenuSel
--     highlight link TelescopePromptNormal NormalFloat
--     highlight link TelescopePromptBorder FloatBorder
--     highlight link TelescopeNormal CursorLine
--     highlight link TelescopeBorder CursorLineBg
-- ]])

telescope.setup {
    defaults = {
        layout_config = {
            prompt_position = 'top',
        },
        sorting_strategy = 'ascending',
    },
    mappings = {
        i = {
            -- To make Escape close Telescope, rather than go into "normal" mode...not working
            -- ["<esc>"] = actions.close,
        },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        buffers = {
            previewer = false,
            show_all_buffers = true,
            sort_mru = true,
            layout_config = {
                width = 80,
            },
            mappings = {
                i = {
                    ["<c-d>"] = "delete_buffer"
                },
                n = {
                    ["<c-d>"] = "delete_buffer"
                }
            }
        },
        oldfiles = {
            prompt_title = 'History',
        },
        lsp_references = {
            previewer = false,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                       -- false will only do exact matching
            override_generic_sorter = true,     -- override the generic sorter
            override_file_sorter = true,        -- override the file sorter
            case_mode = "smart_case",           -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        file_browser = {
            -- theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                    ["<C-k>"] = lga_actions.quote_prompt(),
                    ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
        },
    },
    --[[
    file_ignore_patterns = {
        '.git/',
        'public/',
        'vendor/',
    }
    ]]
}
-- Load fzf
require('telescope').load_extension('fzf')
require('telescope').load_extension('live_grep_args')

-- Load telescope-file-browser
require("telescope").load_extension "file_browser"

-- Keymaps
vim.api.nvim_set_keymap('n', '<leader>ft', ':Telescope<CR>', { noremap = true })
vim.keymap.set('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
vim.keymap.set('n', '<leader>fa', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]])
vim.keymap.set('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
vim.keymap.set('n', '<leader>fg', [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])
vim.keymap.set('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
vim.keymap.set('n', '<leader>fs', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
vim.keymap.set('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').commands()<CR>]])
vim.keymap.set('n', '<leader>fk', [[<cmd>lua require('telescope.builtin').keymaps()<CR>]])
vim.keymap.set('n', '<leader>fr', [[<cmd>lua require('telescope.builtin').resume()<CR>]])
vim.keymap.set('n', '<leader>cs', [[<cmd>lua require('telescope.builtin').colorscheme()<CR>]])
-- telescope-file-browser
-- vim.keymap.set('n', '<leader>fe', [[<cmd>lua require('telescope').extensions.file_browser.file_browser<CR>]])
vim.api.nvim_set_keymap("n", "<leader>fe", ":Telescope file_browser<CR>", { noremap = true })
