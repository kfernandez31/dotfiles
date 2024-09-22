try_source() { [ -f "$1" ] && source "$1" }

# Load P10k instant prompt
try_source "${XDG_CACHE_HOME:-$HOME/.cache}"/p10k-instant-prompt-"${(%):-%n}".zsh

# Load plugins via Antidote
try_source "$HOMEBREW_PREFIX"/opt/antidote/share/antidote/antidote.zsh && antidote load "${ZDOTDIR:-$HOME}"/.zsh_plugins.txt

# Load as much as possible asynchronously
async_files=( .zsh_{completions,aliases,functions} )
for file in "${async_files[@]}"; do
    zsh-defer try_source "${ZDOTDIR:-$HOME/.config/zsh}/$file"
done

# Load the rest synchronously
sync_files=( .zsh_{hist_settings,bindings,others} .p10k.zsh )
for file in "${sync_files[@]}"; do
    try_source "${ZDOTDIR:-$HOME/.config/zsh}/$file"
done

# Wait for all calls to zsh-defer just to be safe
wait
