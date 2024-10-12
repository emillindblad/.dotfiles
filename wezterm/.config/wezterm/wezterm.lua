local wezterm = require('wezterm')
local config = {}

config.color_scheme = 'GruvboxDarkHard'
config.colors = {
  background = '#282828',
}

config.window_background_opacity = 0.9

config.font = wezterm.font('Source Code Pro', { weight = 'Medium' })
-- config.font = wezterm.font('Monocraft', { weight = 'Medium' })

if wezterm.hostname() == 'endor' then
  config.font_size = 13.2
end

config.enable_tab_bar = false
config.audible_bell = 'Disabled'
return config
