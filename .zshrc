# Bachns' aliases
alias ll='ls -lh --color=auto'
alias l='ls -lah --color=auto'


# Home brew
eval "$(/opt/homebrew/bin/brew shellenv)"


# Starship
eval "$(starship init zsh)"


# ZSH plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Disable the ZSH underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
