return {
  'ellisonleao/gruvbox.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('gruvbox').setup {
      italic = {
        strings = false,
        comments = true,
        operators = false,
        folds = false,
        emphasis = false,
      },
      contrast = 'hard',
      transparent_mode = true,
      overrides = {
        FloatBorder = { fg = '#7c6f64' },
        LspInfoBorder = { fg = '#7c6f64' },
        QuickFixLine = { bg = '#504945' },
        TreesitterContext = { bg = '#504945' }, -- Transparent by default
        Directory = { fg = '#83a598', bold = true },
      },
    }

    --Bg for non transparent mode '#282828'
    vim.o.background = 'dark'
    vim.cmd([[colorscheme gruvbox]])
  end,
}
