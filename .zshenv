#!/bin/sh

# xdg-ninja
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# dotfiles
export DOTFILES_HOME="$HOME"/.dotfiles

# tldr
export TLDR_CACHE_DIR="$XDG_CACHE_HOME"/tldr

# sqlite # TODO: remove
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history

# python
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh

# eza
export EZA_DEFAULT_OPTS_FILE="$XDG_CONFIG_HOME"/eza/ezarc

# fzf
export FZF_DEFAULT_COMMAND='fd . --hidden --color always'
export FZF_DEFAULT_OPTS_FILE="$XDG_CONFIG_HOME"/fzf/fzfrc

export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_CTRL_T_OPTS=$(<"$XDG_CONFIG_HOME"/fzf/fzf_ctrl_t_opts)

export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
export FZF_ALT_C_OPTS=$(<"$XDG_CONFIG_HOME"/fzf/fzf_alt_c_opts)

export FZF_CTRL_R_OPTS=$(<"$XDG_CONFIG_HOME"/fzf/fzf_ctrl_r_opts)

# TODO: think of a similar command to alt-c for opening a file

# gradle # TODO: remove
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

# rustup
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

# cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo

# zinit
export ZINIT_HOME="$XDG_DATA_HOME"/zinit.git

# less
export LESSHISTFILE="$XDG_STATE_HOME"/less/history

# zsh history
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTDUP=erase
export HISTCONTROL=ignorespace:ignoredups

# zsh autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#625e85" #TODO: toggle
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# vim
export EDITOR=$(command -v nvim || command -v vim)
export VISUAL=$EDITOR

# locale
export LC_ALL=en_US.UTF-8
export LANG=$LC_ALL

# GCC colors
# TODO: toggle
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# man
export MANPAGER='nvim +Man!'
export MANWIDTH=999
