-- Set up Mason to automatically install LSP servers
-- require('mason').setup()
-- require('mason-lspconfig').setup({automatic_installation = true})

-- Change to below boilerplate as per v2 to v3 migration guide in github
local lsp_zero = require('lsp-zero')

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'intelephense', 'pyright', 'volar'},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})
-- Completion item labels
local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format()

cmp.setup({
    formatting = cmp_format,
})
-- Documentation window scrolling
local cmp = require('cmp')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- scroll up and down the documentation window
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }),
})


-- PHP
require('lspconfig').intelephense.setup({})

-- Python
require('lspconfig').pyright.setup({})

-- Vue, and take over JavaScript, TypeScript
require('lspconfig').volar.setup({
    -- Enable "Take Over Mode" where Volar will provide all JS/TS LSP Services
    -- This drastically improves the responsiveness of diagnostic updates on change
    filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue'},
})

-- TailwindCSS
require('lspconfig').tailwindcss.setup({})

-- Key mappings
local bufopts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>)')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>)')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>)')
vim.keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp_buf.definition()<CR>)')
vim.keymap.set('n', '<leader>gi', ':Telescope lsp_implementations<CR>)')
vim.keymap.set('n', '<leader>gr', ':Telescope lsp_references<CR>)')
vim.keymap.set('n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>)')
vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>)')

-- Sign config
vim.fn.sign_define('DiagnosticSignError', {text = '', texthl = 'DiagnosticSignError'})
vim.fn.sign_define('DiagnosticSignWarn', {text = '', texthl = 'DiagnosticSignWarn'})
vim.fn.sign_define('DiagnosticSignInfo', {text = '', texthl = 'DiagnosticSignInfo'})
vim.fn.sign_define('DiagnosticSignHint', {text = '', texthl = 'DiagnosticSignHint'})

-- vim.diagnostic.config({
--     virtual_text =  true,
--     float = {
--         source = true,
--     }
-- })
vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
