require("neo-tree").setup({
    lazy = false, -- lazy loading
    use_libuv_file_watcher=true, -- auto refresh
})

-- Keymaps
vim.keymap.set("n", "<leader>tf", "<Cmd>Neotree<CR>")
