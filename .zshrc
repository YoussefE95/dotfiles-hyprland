HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

bindkey '^[[3~' delete-char
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

alias rang='source ranger'
alias vpn='expressvpn'
alias py='python3'

source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
