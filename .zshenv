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

# python
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export SHELL_SESSIONS_DISABLE=1

# eza
export EZA_DEFAULT_OPTS_FILE="$XDG_CONFIG_HOME"/eza/ezarc

# fzf
# TODO: option-delete: delete word backward
export FZF_DEFAULT_COMMAND='fd . --hidden --follow --color=always'
export FZF_DEFAULT_OPTS_FILE="$XDG_CONFIG_HOME"/fzf/fzfrc

export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_CTRL_T_OPTS=$(<"$XDG_CONFIG_HOME"/fzf/fzf_ctrl_t_opts)

export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type=d"
export FZF_ALT_C_OPTS=$(<"$XDG_CONFIG_HOME"/fzf/fzf_alt_c_opts)

export FZF_CTRL_R_OPTS=$(<"$XDG_CONFIG_HOME"/fzf/fzf_ctrl_r_opts)

# ripgrep
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME"/ripgrep/ripgreprc

# rustup
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

# cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo

# less
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export LESSUTFCHARDEF=E000-F8FF:p,F0000-FFFFD:p,100000-10FFFD:p

# zsh autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7c6f64"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# vim
export EDITOR=$(command -v nvim || command -v vim || command -v vi)
export VISUAL=$EDITOR

# locale
export LC_ALL=en_US.UTF-8
export LANG=$LC_ALL

# GCC colors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# man
export MANPAGER='nvim +Man!'
export MANWIDTH=999
