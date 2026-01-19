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
# bindkey '^l' autosuggest-accept
# use wezterm-keys instead

# Starship
eval "$(starship init zsh)"

# SSH agent
#eval "$(ssh-agent -s)"


#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# JAVA versions manager
#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"

# Java home
export JAVA_HOME=$(/usr/libexec/java_home -v 17)
# Ant home
export ANT_HOME=$(brew --prefix ant)/libexec


fastfetch

# Added by Antigravity
export PATH="/Users/bachns/.antigravity/antigravity/bin:$PATH"


# SSH management
function s() {
  local target=$(grep -E "^Host " ~/.ssh/config | awk '{$1=""; print}' | grep -v "[*?]" | fzf --height=40% --layout=reverse --border --prompt="Select Server: ")
  if [ -n "$target" ]; then
    echo "Connecting to $target..."
    local hostname=$(echo $target | awk '{print $1}')
    ssh "$hostname"
  fi
}

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

function yf() {
  local target=$(grep -E "^Host " ~/.ssh/config | awk '{$1=""; print}' | grep -v "[*?]" | fzf --height=40% --layout=reverse --border --prompt="Select Server: ")
  if [ -n "$target" ]; then
    echo "Connecting to $target..."
    local hostname=$(echo $target | awk '{print $1}')
    yazi sftp://"$hostname"
  fi
}
