function _G.ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^user') and not name:match('nvim-tree') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

-- Key mapping
vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>lua ReloadConfig()<CR>", { noremap = true, silent = false })
