local colors = {
  color6   = "#353535",
  color7   = "#e5786d",
  color10  = "#95e454",
  color16  = "#666666",
  color13  = "#8ac6f2",
  color14  = "#a8a8a8",
  color15  = "#969696",
  color0   = "#444444",
  color1   = "#f2c68a",
  color2   = "#d0d0d0",
  color3   = "#585858",
}

local wombat = {
  visual = {
    a = { fg = colors.color0, bg = colors.color1 },
    b = { fg = colors.color2, bg = colors.color3 },
  },
  replace = {
    a = { fg = colors.color6, bg = colors.color7 },
    b = { fg = colors.color2, bg = colors.color3 },
  },
  insert = {
    a = { fg = colors.color0, bg = colors.color10 },
    b = { fg = colors.color2, bg = colors.color3 },
  },
  normal = {
    a = { fg = colors.color0, bg = colors.color13 },
    b = { fg = colors.color2, bg = colors.color3 },
    c = { fg = colors.color14, bg = colors.color0 },
  },
  inactive = {
    a = { fg = colors.color15, bg = colors.color0 },
    b = { fg = colors.color16, bg = colors.color6 },
    c = { fg = colors.color15, bg = colors.color6 },
  },

}

require('lualine').setup {
    options = {
        theme = wombat,
        component_separators = { left = "|", right = "|" }
    },
    sections = {
        lualine_b = {
            'branch', 'diagnostics' },
        lualine_c = {
            {
                'filename',
                symbols = {
                    readonly = '[RO]'
                }
            }
        },
    },
}

