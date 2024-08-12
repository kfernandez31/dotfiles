# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}"/p10k-instant-prompt-"${(%):-%n}".zsh ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}"/p10k-instant-prompt-"${(%):-%n}".zsh
fi

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source Zinit
source "$ZINIT_HOME"/zinit.zsh

# Plugins
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light hlissner/zsh-autopair

# Snippets
zinit snippet OMZP::sudo
zinit snippet OMZP::fzf
# zinit snippet OMZP::command-not-found # FIXME
# zinit snippet OMZP::fancy-ctrl-z      # FIXME

# Download the PowerLevel10k prompt, if it's not there yet
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Prompt. To customize, run `p10k configure` or edit ~/.p10k.zsh.
# TODO: consider ohmyposh as p10k is on life support mode
[[ ! -f "${ZDOTDIR:-$HOME}"/.p10k.zsh ]] || source "${ZDOTDIR:-$HOME}"/.p10k.zsh

# Load completions
autoload -Uz compinit && compinit -i -d "${XDG_CACHE_HOME:-$HOME/.cache}"/zsh/zcompdump-"$ZSH_VERSION"
_comp_options+=(globdots) # Include hidden files
zinit cdreplay -q

# History
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Fix backspace key
autoload -U select-word-style
select-word-style bash

# Keybindings
bindkey -e # Emacs
bindkey '^p'   history-search-backward
bindkey '^n'   history-search-forward
bindkey '^[w'  kill-region
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Completions
zstyle ':completion:**' use-cache on
if [[ -n "$XDG_CACHE_HOME" && -d "$XDG_CACHE_HOME"/zsh ]]; then
    zstyle ':completion:**' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
else
    zstyle ':completion:**' cache-path "$HOME"/.zcompcache
fi

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # TODO: configure LS_COLORS
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:*'  fzf-preview '[[ -d $realpath ]] && eza -1 -F --group-directories-first --color=always --color-scale $realpath || bat --style=numbers --color=always $realpath'

# Shell integrations
eval "$(thefuck --alias)" # can be slow
eval "$(zoxide init zsh)"
source <(fzf --zsh)
source "$XDG_CONFIG_HOME"/zsh/.iterm2_shell_integration.zsh

# Aliases and functions
if [[ -n "$XDG_CONFIG_HOME" && -d "$XDG_CONFIG_HOME"/zsh ]]; then
    source "$XDG_CONFIG_HOME"/zsh/.zsh_aliases
    source "$XDG_CONFIG_HOME"/zsh/.zsh_functions
else
    source "$HOME"/.zsh_aliases
    source "$HOME"/.zsh_functions
fi

# TODO: remove the lines below
eval "$(mise activate zsh)"
source ~/.brazil_completion/zsh_completion

# TODO: run these but once. Maybe just add as login items? 
# skhd --start-service
# yabai --start-service
# brew services start borders
# brew services start sketchybar

# TODO:
# session_name="main"
#
# tmux has-session -t=$session_name 2> /dev/null
#
# if [[ $? -ne 0 ]]; then
#     TMUX='' tmux new-session -d -s "$session_name"
# fi
#
# if [[ -z "$TMUX" ]]; then
#     tmux attach -t "$session_name"
# else
#     tmux switch-client -t "$session_name"
# fi

export PATH=$PATH:/Users/kkramarz/.spicetify
