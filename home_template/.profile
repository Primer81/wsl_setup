#!/usr/bin/env bash
## Author: Ethan Larkham
## Date: 10-10-2016
## ~/etc/profile

# Create downloads dir in tmpfs
mkdir -p /tmp/$USER-tmp/downloads

# XDG Runtime
export XDG_RUNTIME_DIR="$HOME/var/run"
rm -rf "$XDG_RUNTIME_DIR"
mkdir -p "$XDG_RUNTIME_DIR"

export XDG_CONFIG_HOME="$HOME/etc"
export XDG_DATA_HOME="$HOME/var/data"

# Paths
SCOOP_BIN="/mnt/c/scoop/shims"
MIX_BIN="$HOME/var/data/mix/escripts"
LOCAL_BIN="$HOME/sys/masks:$HOME/bin:$HOME/bin/alias:$HOME/bin/tools:$HOME/bin/tools/wmutil"
export PATH="$LOCAL_BIN:$MIX_BIN:$SCOOP_BIN:/usr/local/sbin:/sbin:/usr/sbin:$PATH"
export MANPATH="$HOME/var/man:$MANPATH"

# Overrides
export MIX_HOME="$HOME/var/data/mix"
export MIX_ARCHIVES="$HOME/var/data/mix/archives"
export R_LIBS_USER="$HOME/bin/lib/R"
export GRADLE_USER_HOME="$HOME/var/data/gradle"
export CARGO_HOME="$HOME/var/data/cargo"
export GOPATH="$HOME/var/data/go"
#export GOROOT="$HOME/var/sdk/go"

export DOCKER_HOST=localhost:2375

export DISPLAY=localhost:0

# fix default permissions
if [ "$(umask)" = "0000" ]; then
  umask 0022
fi

# set dir colors
#eval "$(dircolors -b $HOME/.dircolors)"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
      source "$HOME/.bashrc"
    fi
fi
