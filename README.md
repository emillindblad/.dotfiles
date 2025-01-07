# .dotfiles
Config files for various software that I use. My Neovim config can be found [here](https://github.com/emillindblad/.dotfiles/tree/master/nvim/.config/nvim).

## Dependencies
Small utils needed for various applications.
- [ctpv](https://github.com/NikitaIvanovV/ctpv) - Previewer - lf
- [fzf](https://github.com/junegunn/fzf) - Fuzzy finder - zsh
- [ripgrep](https://github.com/BurntSushi/ripgrep) - Search tool - nvim
- [xclip](https://github.com/astrand/xclip) - Clipboard manager - nvim,tmux

## Guide on how to use i3-gaps with KDE
1. Create a new systemd *user unit* to start i3

`~/.config/systemd/user/plasma-custom-wm.service`
```
[Install]
WantedBy=plasma-workspace.target

[Unit]
Description=Plasma Custom Window Manager
Before=plasma-workspace.target

[Service]
ExecStart=/usr/bin/i3
Slice=session.slice
Restart=on-failure
MemoryAccounting=false
```
2. Mask the old unit, so that it doesn't start:\
    `systemctl --user mask plasma-kwin_x11.service`
3. Do a daemon-reload:\
    `systemctl --user daemon-reload`
4. Enable the new unit:\
    `systemctl --user enable plasma-custom-wm.service`

If you want to go back to KWin, unmask `plasma-kwin_x11.service` and disable
`plasma-custom-wm.service`.

### Old method, deprecated since KDE 5.25!
1. Install i3-gaps, feh and picom with your package manager.
2. Clone this repo to a folder of your choice.
3. Copy `wm.sh` to `~/.config/plasma-workspace/env/wm.sh` This replaces Kwin with i3-gaps.
4. Copy `.config/i3/config` to `~/.config/i3/`.
5. Edit the i3 config for your wallpaper, colors, autostart etc.
6. Logout/reboot, choose Plasma as your desktop environment at login.
