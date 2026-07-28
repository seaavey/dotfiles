export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
  git
  sudo
  autojump
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="brave"

export PATH="$HOME/.local/bin:$PATH"

eval "$(zoxide init zsh)"
