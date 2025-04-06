require('which-key').setup()

local mappings = {
    -- ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
    -- ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
    -- ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
    -- ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
    -- ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
}

local options = {
    -- icons = {
    --     breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    --     separator = "➜", -- symbol used between a key and it's label
    --     group = "+", -- symbol prepended to a group
    -- },
}

-- Document existing key chains
require('which-key').add(mappings, options)

