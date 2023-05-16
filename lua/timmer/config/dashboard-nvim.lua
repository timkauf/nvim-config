require('dashboard').setup {
    theme = 'hyper',
    config = {},
    hide = {
      statusline,
      tabline,
      winbar,
    },
    preview = {
      command,
      file_path,
      file_height,
      file_width,
    },
}

-- Key mappings
vim.keymap.set('n', '<Leader>db', ':Dashboard<CR>)')
