local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({bufferer = bufnr})
end)

vim.diagnostic.config({
  -- No inline diagnostic text; popups only
  virtual_text = false,
})

lsp_zero.set_sign_icons({
    error = '',
    warn = '',
    hint = '',
    info = '',
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'intelephense',
        'pyright',
        'volar',
        'tailwindcss',
        'gopls',
    },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end
    }
})

