# Path
export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin

# Default programs
export EDITOR="nvim"
export TERMINAL="konsole"
export READER="zathura"
export BROWSER="firefox"

# Clean-up home
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export IRBRC="$XDG_CONFIG_HOME/irb/irbrc"
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
