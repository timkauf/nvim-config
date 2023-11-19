require("nvim-treesitter.configs").setup({
    ensure_installed = {"c", "javascript", "lua", "php", "python", "vim", "vue", "help"},
    ignore_install = { 'help' }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { 'help' }, -- list of language that will be disabled
    },
    indent = {
        -- Needed because treesitter highlight turns off autoindent for php files
        enable = true,
    },
    context_commentstring = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['if'] = '@function.inner',
                ['af'] = '@function.outer',
                ['ia'] = '@parameter.inner',
                ['aa'] = '@parameter.inner',
            },
        },
    },
})

-- For Laravel Blade files
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.blade = {
  install_info = {
    url = "https://github.com/EmranMR/tree-sitter-blade",
    files = {"src/parser.c"},
    branch = "main",
  },
  filetype = "blade"
}

vim.cmd([[
    augroup BladeFiltypeRelated
        autocmd!
        autocmd BufNewFile,BufRead *.blade.php set ft=blade
    augroup END
]])

