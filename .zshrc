# Bachns' aliases
alias ll='ls -lh --color=auto'
alias l='ls -lah --color=auto'

if [[ $(uname) == "Darwin" ]]; then
  # Home brew
  eval "$(/opt/homebrew/bin/brew shellenv)"

  # ZSH plugins for MacOS
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

elif [[ $(uname) == "Linux" ]]; then
  # ZSH plugins for linux
  source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
  source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Disable the ZSH underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Keybind ZSH
bindkey '^l' autosuggest-accept

# Starship
eval "$(starship init zsh)"



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# JAVA versions manager
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/bachns/.lmstudio/bin"
