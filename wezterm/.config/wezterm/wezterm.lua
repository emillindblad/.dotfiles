local wezterm = require('wezterm')
local config = {}

config.color_scheme = 'GruvboxDarkHard'
config.colors = {
  background = '#2e3440',
}

config.window_background_opacity = 0.9

config.font = wezterm.font('Source Code Pro', { weight = 'Medium' })
config.font_rules = {
  {
    intensity = 'Bold',
    font = wezterm.font('Source Code Pro', { bold = true }),
  },
}

config.enable_tab_bar = false
return config
