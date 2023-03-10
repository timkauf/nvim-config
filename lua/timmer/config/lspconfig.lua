-- Set up Mason to automatically install LSP servers
require('mason').setup()
require('mason-lspconfig').setup({automatic_installation = true})

-- PHP
require('lspconfig').intelephense.setup({})

-- Vue, and take over JavaScript, TypeScript
require('lspconfig').volar.setup({
    -- Enable "Take Over Mode" where Volar will provide all JS/TS LSP Services
    -- This drastically improves the responsiveness of diagnostic updates on change
    filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue'},
})

-- TailwindCSS
require('lspconfig').tailwindcss.setup({})

-- Key mappings
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>)')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>)')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>)')
vim.keymap.set('n', '<Leader>gd', '<cmd>lua vim.lsp_buf.definition()<CR>)')
vim.keymap.set('n', '<Leader>gi', ':Telescope lsp_implementations<CR>)')
vim.keymap.set('n', '<Leader>gr', ':Telescope lsp_references<CR>)')
vim.keymap.set('n', '<Leader>K', '<cmd>lua vim.lsp.buf.hover()<CR>)')
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>)')

-- Sign config
vim.fn.sign_define('DiagnosticSignError', {text = '', texthl = 'DiagnosticSignError'})
vim.fn.sign_define('DiagnosticSignWarn', {text = '', texthl = 'DiagnosticSignWarn'})
vim.fn.sign_define('DiagnosticSignInfo', {text = '', texthl = 'DiagnosticSignInfo'})
vim.fn.sign_define('DiagnosticSignHint', {text = '', texthl = 'DiagnosticSignHint'})
