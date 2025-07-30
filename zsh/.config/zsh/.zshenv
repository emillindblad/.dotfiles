# Path
# export PATH=/home/emil/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.cargo/env"
export PATH="$PATH:$HOME/go/bin"

# Default programs
export EDITOR="nvim"
export TERMINAL="wezterm"
export READER="zathura"
export BROWSER="firefox"

export DOTFILES="$HOME/.dotfiles"

# Clean-up home
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export HISTFILE="$XDG_DATA_HOME/zsh/history"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export npm_config_prefix="$HOME/.local"
