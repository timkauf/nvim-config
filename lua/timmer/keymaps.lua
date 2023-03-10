function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
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

-- Command mode
map('n', ';', ':')
map('n', ':', ';')
map('v', ';', ':')
map('v', ':', ';')

-- BUFFERS
map('n', '<Tab>', ':bnext<CR>')
map('n', '<S-Tab>', ':bprevious<CR>')

-- WINDOWS
map('n', '<leader>w', '<C-w>w')

-- BRACKETS
-- Autopairs
map('i', '"', '""<Left>') 
map('i', "'", "''<Left>") 
map('i', '(', '()<Left>') 
map('i', '{', '{}<Left>') 
map('i', '[', '[]<Left>') 
map('i', '<', '<><Left>') 

-- VISUAL MODE SELECTIONS
-- Reselect visual block after indent/outdent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- SEARCH
-- Search/replace - put something in search buffer (using *, /, etc) before triggering
map('n', '<leader>s', ':%s///g<left><left>')
-- Keep search matches in middle of window
map('n', 'n',  'nzzzv')
map('n', 'N',  'Nzzzv')

-- REGISTERS
-- Copy to Mac clipboard
map('n', '<leader>y', '"*y')
map('v', '<leader>y', '"*y')

-- TERMINAL COMMANDS
-- Open current file in default Mac app
map('n', '<leader>x', ':!open %<CR><CR>')

