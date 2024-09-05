# Load P10k instant prompt
P10K_INSTANT_PROMPT_PATH="${XDG_CACHE_HOME:-$HOME/.cache}"/p10k-instant-prompt-"${(%):-%n}".zsh
[[ -f "$P10K_INSTANT_PROMPT_PATH" ]] && source "$P10K_INSTANT_PROMPT_PATH"

# Load P10k configuration
source "${ZDOTDIR:-$HOME/.config/zsh}"/.p10k.zsh

# Load plugins via Antidote
source "$HOMEBREW_PREFIX"/opt/antidote/share/antidote/antidote.zsh
antidote load "${ZDOTDIR:-$HOME}"/.zsh_plugins.txt

# Load completions
autoload -Uz compinit && compinit -i -d "${XDG_CACHE_HOME:-$HOME/.cache}"/zsh/zcompdump
_comp_options+=(globdots) # Include hidden files

# History
hist_opts=(
    append_history         # append to histfile instead of overwriting it
    share_history          # share history between sessions
    hist_ignore_space      # ignore commands prepended by a space
    hist_ignore_all_dups   # remove oldest duplicates once history reaches its max size
    hist_expire_dups_first # remove duplicates once history reaches its max size
    hist_save_no_dups      # don't save duplicates
    hist_ignore_dups       # don't duplicate previous entry
    hist_find_no_dups      # don't display duplicates, even if they aren't contiguous
    # extended_history       # will record timestamp # TODO: take that into account in fzf
)
for opt in "${hist_opts[@]}"; do
    setopt "$opt"
done

# Fix alt+arrow navigation
autoload -U select-word-style
select-word-style bash

# Aliases, functions, bindings
for file in aliases functions bindings; do
    source "${ZDOTDIR:-$HOME/.config/zsh}/.zsh_$file"
done

# Completions
zstyle ':completion:**' use-cache on
zstyle ':completion:**' cache-path  "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/zcompcache"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'

export LS_COLORS="$(vivid generate ${XDG_CONFIG_HOME:-$HOME/.config}/vivid/gruvbox-material.yml)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' menu no
# TODO: disable preview on command flag completions
# TODO: add support for marking

# Shell integrations/completions
# eval "$(thefuck --alias)" # badly affects startup time => keep commented
eval "$(zoxide init zsh)"
source <(fzf --zsh)
source <(procs --gen-completion-out zsh)
source <(delta --generate-completion zsh)
source "${XDG_CONFIG_HOME:-$HOME/.config}"/zsh/.iterm2_shell_integration.zsh
# source <(curl -s https://iterm2.com/shell_integration/zsh)
source ~/.brazil_completion/zsh_completion # TODO: remove

# TODO:
# zsh-users/zsh-syntax-highlighting -> zdharma-continuum/fast-syntax-highlighting
# P10k -> ohmyposh
# zinit light wfxr/forgit
# zinit light jeffreytse/zsh-vi-mode
# ohmyzsh plugins: sudo, fzf