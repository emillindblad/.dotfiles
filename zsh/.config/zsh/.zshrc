#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|

# run: echo 'export ZDOTDIR="$HOME/.config/zsh"' >> /etc/zsh/zshenv
# to tell zsh to use .config folder

export ZSH="/home/emil/.oh-my-zsh"
export ZSH_CUSTOM="/home/emil/.config/zsh/custom"

ZSH_THEME="customtheme"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git fzf)

# Settings for good fzf history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

source $ZSH/oh-my-zsh.sh

# Source script for lfcd
source $DOTFILES/lf/.config/lf/lf.bash

# Aliases
alias zshconfig="nvim ~/.config/zsh/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias weather="curl wttr.in"
alias vrc="cd ~/.dotfiles && nvim ."
alias vim="nvim"
alias v="nvim"
alias sshagent="eval $(ssh-agent)"
alias xcp="xclip -selection clipboard"

# Start ssh agent
[ ! -f ~/.ssh.agent ] && ssh-agent -s >~/.ssh.agent
eval `cat ~/.ssh.agent` >/dev/null
if ! kill -0 $SSH_AGENT_PID 2>/dev/null; then
    ssh-agent -s >~/.ssh.agent
    eval `cat ~/.ssh.agent` >/dev/null
fi
