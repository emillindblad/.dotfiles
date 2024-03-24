local wezterm = require('wezterm')
local config = {}

config.color_scheme = 'GruvboxDarkHard'
config.colors = {
  background = '#2e3440',
}

config.window_background_opacity = 0.9

config.font = wezterm.font('Source Code Pro', { weight = 'Medium' })
-- config.font = wezterm.font('Monocraft', { weight = 'Medium' })

config.enable_tab_bar = false
return config
