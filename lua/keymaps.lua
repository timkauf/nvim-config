function map(mode, key, result, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, key, result, options)
end

-- MOTIONS
-- Move lines down/up
map('n', '<C-j>', ":m .+1<CR>==")
map('n', '<C-k>', ":m .-2<CR>==")
map('v', '<C-j>', ":m '>+1<CR>gv=gv")
map('v', '<C-k>', ":m '<-2<CR>gv=gv")

-- MODE SWITCHING
-- Escape key
map('i', 'jj', '<ESC>')
map('v', '<leader>e', '<ESC>')
map('c', '<leader>e', '<C-c>')

-- EX COMMAND MODE
-- Swap colon and semi-colon
map('n', ';', ':')
map('n', ':', ';')
map('v', ';', ':')
map('v', ':', ';')
-- Repeat last Ex command
map('n', '<leader>.', '@:<CR>')

-- LINE NUMBERS
-- Toggle relative numbers
map('n', '<leader>ll', ':set relativenumber!<CR>')

-- BUFFERS
map('n', '<leader>bb', '<C-6>') --toggle
map('n', '<leader>bn', ':bnext<CR>')
map('n', '<leader>bp', ':bprev<CR>')
map('n', '<leader>bd', ':Bdelete<CR>')
map('n', '<leader>bq', ':bufdo bd<CR>') --close all buffers
map('n', '<leader>be', ':bufdo e<CR>') --refresh all buffers

-- WINDOWS
map('n', '<leader>w', '<C-w>w')

-- BRACKETS
-- Autopairs  (replaced by install of Autopairs plugin)
-- map('i', '"', '""<Left>') 
-- map('i', "'", "''<Left>") 
-- map('i', '(', '()<Left>') 
-- map('i', '{', '{}<Left>') 
-- map('i', '[', '[]<Left>') 
-- map('i', '<', '<><Left>') 

-- VISUAL MODE SELECTIONS
-- Reselect visual block after indent/outdent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- SEARCH
-- Search/replace - put something in search buffer (using *, /, etc) before triggering
map('n', '<leader>sr', ':%s///g<left><left>')
-- Visual block search/replace
map('v', '<leader>sv', ':s///g<left><left><left>')
-- Keep search matches in middle of window
map('n', 'n',  'nzzzv')
map('n', 'N',  'Nzzzv')

-- REGISTERS
-- Copy to Mac clipboard
map('n', '<leader>y', '"*y')
map('v', '<leader>y', '"*y')

-- BUILT-IN TERMINAL
map('n', '<leader>t', ':terminal<CR>')
-- Escape to normal mode
map('t', 'jj', [[<C-\><C-n>]])

-- TERMINAL COMMANDS
-- Format JSON file
map('n', '<leader>jq', ':%!jq .<CR>')
-- Open current file in default Mac app
map('n', '<leader>x', ':!open %<CR><CR>')

