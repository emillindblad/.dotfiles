return {
  'tpope/vim-dadbod',
  dependencies = { 'kristijanhusak/vim-dadbod-ui' },
  cmd = { 'DBUI' },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_use_nvim_notify = 1
  end,
}
