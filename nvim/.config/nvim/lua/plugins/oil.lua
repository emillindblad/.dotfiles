return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      view_options = {
        show_hidden = true,
      },
      win_options = {
        signcolumn = 'yes',
      },
      keymaps = {
        ['<C-p>'] = false,
        ['-'] = 'actions.close',
      },
    }

    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
  end,
}
