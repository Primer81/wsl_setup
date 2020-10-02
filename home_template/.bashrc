if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi

# autocomplete binds
bind 'set show-all-if-ambiguous on'
#bind 'set completion-ignore-case on'
#bind 'set completion-query-items 1000'
bind 'set match-hidden-files off'
bind 'set mark-symlinked-directories On'
#bind 'set colored-stats on'
#bind 'Tab: menu-complete'

# clean pasting
bind 'set enable-bracketed-paste on'

# pageup/down arrow searches through history
bind '"\e[5~": history-search-backward'
bind '"\e[6~": history-search-forward'

case $- in
  *i*) ;;
    *) return;;
esac

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

BLACK="$(   tput setaf 0 )"
RED="$(     tput setaf 1 )"
GREEN="$(   tput setaf 2 )"
YELLOW="$(  tput setaf 3 )"
BLUE="$(    tput setaf 4 )"
MAGENTA="$( tput setaf 5 )"
CYAN="$(    tput setaf 6 )"
WHITE="$(   tput setaf 7 )"

NO_COLOR="$(tput sgr0)"

# Prompt
#export PS1="\[\033[38;5;15m\][\[$(tput sgr0)\]\[\033[38;5;4m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]]\\$ \[$(tput sgr0)\]"
export PS1="\[$(tput bold)\][\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;75m\]\u\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;15m\]]\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"

# Path
#export GOPATH="$HOME/etc/go"
export PATH="$PATH:$GOPATH/bin"

# Editor
export EDITOR="nvim"
export VISUAL="less"
export PAGER="less"

# Config
alias ls='ls --group-directories-first --time-style=+"%m.%d.%Y %H:%M" --color -h'
alias ll='ls -l'
alias la='ls -la'

alias df="df -h"
alias cp="cp -i"
alias free='free -m' # show sizes in MB

alias compton="compton --config=$HOME/etc/compton.conf"
alias sbbdep="sbbdep -c $HOME/var/cache/sbbdep.cache"
alias irssi="irssi --home=$HOME/etc/irssi"

alias java="wmname LG3D; java"
alias virsh="VISUAL=$EDITOR virsh"

# Colors
alias grep='grep --color=tty -d skip'
alias ip="ip -c"
alias less="less -R"
alias diff="diff --color=always"

export GTEST_COLOR="yes" # Google Test Colors

# Alias
alias usermount="sudo mount -o gid=100,uid=1000"
alias dl="youtube-dl"
#alias vim="nvim"
alias dep="sbbdep"
#alias paket="./.paket/paket"
alias docfx="docfx.exe"
alias vim="nvim"
alias go="$HOME/var/data/go/bin/go1.11"
alias ws="lw"
alias wl="lw -l"
alias wa="lw -la"

# Fixes for Windows terminal
export DISPLAY=:0
export TERM=xterm-256color
#export LS_COLORS=$LS_COLORS:'ow=1;34:'

# Extra
export LIBVIRT_DEFAULT_URI="qemu:///system"

# Man Colors
man() {
  env \
  LESS_TERMCAP_mb=$'\E[01;31m' \
  LESS_TERMCAP_md=$'\E[01;38;5;74m' \
  LESS_TERMCAP_me=$'\E[0m' \
  LESS_TERMCAP_se=$'\E[0m' \
  LESS_TERMCAP_so=$'\E[38;5;246m' \
  LESS_TERMCAP_ue=$'\E[0m' \
  LESS_TERMCAP_us=$'\E[04;38;5;146m' \
  man "$@"
}

# Source Env
s() {
  source "$HOME/bin/env/$1"
}

:
