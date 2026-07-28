export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(
  git
  sudo
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="brave"

export PATH="$HOME/.local/bin:$PATH"

eval "$(zoxide init zsh)"


# Added by Antigravity CLI installer
export PATH="/home/seaavey/.local/bin:$PATH"
