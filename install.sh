#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
# Colors
green()   { printf "\033[32m%s\033[0m\n" "$1"; }
blue()    { printf "\033[34m%s\033[0m\n" "$1"; }
yellow()  { printf "\033[33m%s\033[0m\n" "$1"; }

# --- Package install ---

PACMAN_PKGS=(
  networkmanager
  rofi
  bluez
  bluez-utils
  libnotify
  dunst
  ttf-jetbrains-mono-nerd
  hyprshot
  kitty
  zsh
  brightnessctl
  playerctl
  pavucontrol
  dolphin
  gamemode
  wireplumber
)

YAY_PKGS=(
  waybar-git
)

install_packages() {
  if ! command -v yay &>/dev/null; then
    blue "yay not found. Installing yay..."
    sudo pacman -S --needed --noconfirm base-devel git
    git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
    (cd /tmp/yay-bin && makepkg -si --noconfirm)
    rm -rf /tmp/yay-bin
  fi

  blue "Installing pacman packages..."
  sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}"

  blue "Installing AUR packages..."
  yay -S --needed --noconfirm "${YAY_PKGS[@]}"
}

# --- Config symlinks ---

link_config() {
  local name="$1"
  local src="$DOTFILES_DIR/config/$name"
  local dst="$HOME/.config/$name"

  if [[ -L "$dst" ]] && [[ "$(readlink "$dst")" == "$src" ]]; then
    green "  $name already linked"
    return
  fi

  if [[ -e "$dst" ]]; then
    local backup="${dst}.bak.$(date +%s)"
    yellow "  backing up $dst -> $backup"
    mv "$dst" "$backup"
  fi

  ln -sf "$src" "$dst"
  green "  linked $name"
}

link_configs() {
  blue "Linking configs..."
  for dir in "$DOTFILES_DIR/config"/*/; do
    link_config "$(basename "$dir")"
  done
}

# --- Scripts ---

make_scripts_executable() {
  blue "Making scripts executable..."
  chmod +x "$DOTFILES_DIR/scripts"/*.sh
  green "  done"
}

# --- Main ---

main() {
  echo
  green "  Seaavey's dotfiles installer"
  echo

  install_packages
  link_configs
  make_scripts_executable

  echo
  green "  All done!"
  echo
}

main
