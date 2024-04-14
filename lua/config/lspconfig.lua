require('mason').setup()
require('mason-lspconfig').setup({automatic_installation = true})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Language servers
require('lspconfig').lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'}
            }
        }
    }
})
require('lspconfig').intelephense.setup({capabilities = capabilities})
require('lspconfig').volar.setup({
    capabilities = capabilities,
    filetypes = {
        'typescript',
        'javascript',
        'javascriptreact',
        'typescriptreact',
        'vue',
        'json',
    }
})
require('lspconfig').tailwindcss.setup({capabilities = capabilities})
require('lspconfig').pyright.setup({capabilities = capabilities})
-- require('lspconfig').gopls.setup({capabilities = capabilities})

vim.diagnostic.config({
    virtual_text = false,
    float = {
        source = true,
    }
})

-- Keymaps
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

-- Sign config
vim.fn.sign_define('DiagnosticSignError', {text = '', texthl = 'DiagnosticSignError'})
vim.fn.sign_define('DiagnosticSignWarn', {text = '', texthl = 'DiagnosticSignWarn'})
vim.fn.sign_define('DiagnosticSignInfo', {text = '', texthl = 'DiagnosticSignInfo'})
vim.fn.sign_define('DiagnosticSignHint', {text = '', texthl = 'DiagnosticSignHint'})

