return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', lazy = true },
  },
  config = function()
    local colors = {
      bg0_h = '#1d2021',
      bg0_s = '#32302f',
      bg1 = '#3c3836',
      bg2 = '#504945',
      fg2 = '#d5c4a1',
      fg3 = '#bdae93',
      red = '#fb4934',
      green = '#98971a',
      blue = '#83a598',
      orange = '#fe8019',
    }

    local gruvbat = {
      visual = {
        a = { fg = colors.bg0_h, bg = colors.orange },
        b = { fg = colors.fg2, bg = colors.bg2 },
      },
      replace = {
        a = { fg = colors.bg0_h, bg = colors.red },
        b = { fg = colors.fg2, bg = colors.bg2 },
      },
      insert = {
        a = { fg = colors.bg0_h, bg = colors.green },
        b = { fg = colors.fg2, bg = colors.bg2 },
      },
      normal = {
        a = { fg = colors.bg0_h, bg = colors.blue },
        b = { fg = colors.fg2, bg = colors.bg2 },
        c = { fg = colors.fg3, bg = colors.bg1 },
      },
      inactive = {
        a = { fg = colors.fg3, bg = colors.bg0_s },
        b = { fg = colors.fg3, bg = colors.bg0_s },
        c = { fg = colors.fg3, bg = colors.bg0_s },
      },
    }

    require('lualine').setup {
      options = {
        theme = gruvbat,
        component_separators = { left = '|', right = '|' },
      },
      sections = {
        lualine_b = {
          { 'branch', icon = '' },
          'diagnostics',
        },
        lualine_c = {
          {
            'filename',
            symbols = {
              readonly = '[RO]',
            },
          },
        },
      },
    }
  end,
}
