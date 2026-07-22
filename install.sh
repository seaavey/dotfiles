#!/usr/bin/env bash
set -euo pipefail

# Bootstrap script — clones the repo (if needed) and delegates to bin/dotfiles

REPO="https://github.com/seaavey/dotfiles.git"
TARGET="${DOTFILES_PATH:-$HOME/.dotfiles}"

green()  { printf "\033[32m%s\033[0m\n" "$1"; }
blue()   { printf "\033[34m%s\033[0m\n" "$1"; }
yellow() { printf "\033[33m%s\033[0m\n" "$1"; }

if [[ -d "$TARGET" ]]; then
  blue "dotfiles repo already exists at $TARGET, pulling latest..."
  git -C "$TARGET" pull --rebase
else
  blue "Cloning dotfiles repo to $TARGET..."
  git clone "$REPO" "$TARGET"
fi

# Delegate to the CLI's install command
exec "$TARGET/bin/dotfiles" install
