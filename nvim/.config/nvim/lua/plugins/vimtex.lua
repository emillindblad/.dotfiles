return {
  'lervag/vimtex',
  config = function()
    vim.g.vimtex_complier_progname = 'nvr'
    vim.g.tex_flavor = 'latex'
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_complete_enabled = 1
    vim.g.vimtex_complete_close_braces = 1
    vim.g.vimtex_matchparen_enabled = 0
  end,
}
