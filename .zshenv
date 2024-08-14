#!/bin/sh

# xdg-ninja
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="/run/user/$UID"

# dotfiles
export DOTFILES_HOME="$HOME/.dotfiles"

# eza
export EZA_BASE_CMD="eza --icons --classify --color-scale --group-directories-first --header --git --git-repos --time-style=long-iso --no-user --smart-group"

# less
export LESSHISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}"/less/history

# python
export PYTHONSTARTUP="$HOME"/python/pythonrc

# rustup
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"/rustup

# cargo
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"/cargo

# tldr
export TLDR_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}"/tldr

# zsh
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}"/zsh

# zsh history
export HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}"/zsh/history
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTDUP=erase
export HISTCONTROL=ignorespace: ignoredups

# zsh autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#625e85"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# zinit
export ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"/zinit.git

# vim
export EDITOR=nvim
export VISUAL=nvim

# locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# GCC colors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# man
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# TODO: remove
# sqlite
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history

# gradle
export GRADLE_USER_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"/gradle

