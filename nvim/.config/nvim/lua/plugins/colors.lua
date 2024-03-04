return {
  'ellisonleao/gruvbox.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('gruvbox').setup {
      italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false,
      },
      invert_selection = false,
      contrast = 'hard',
      transparent_mode = true,
      overrides = {
        --LineNr = {fg = "#83a598"},
        netrwDir = { fg = '#83a598' },
        TelescopeBorder = { fg = '#7c6f64' },
        --qfFileName = {fg = "#aed75f"},
        --QuickFixLine = { bg = "#665c54" },
        LspInfoBorder = { fg = '#EBDBB2' },
        TreesitterContext = { bg = '#504945' },
      },
    }

    --[[ vim.api.nvim_create_autocmd("FileType", {
      pattern = "mason",
      callback = function ()
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#EBDBB2" })
      end
    }) ]]

    --Bg for non transparent mode "#292F3A"

    vim.o.background = 'dark'
    vim.cmd([[colorscheme gruvbox]])
  end,
}
