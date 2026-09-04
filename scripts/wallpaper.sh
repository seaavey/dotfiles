#!/usr/bin/env bash
set -euo pipefail

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
FALLBACK_FILE="$WALLPAPER_DIR/wallpaper.jpg"

mkdir -p "$WALLPAPER_DIR"

# Cek apakah sudah ada file gambar di direktori
has_wallpaper() {
  find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.webp" \) | grep -q .
}

# Jika belum ada wallpaper sama sekali, download fallback
if ! has_wallpaper; then
  echo "Wallpaper tidak ditemukan di $WALLPAPER_DIR. Mengunduh fallback wallpaper..."
  curl -sL "https://picsum.photos/2560/1440" -o "$FALLBACK_FILE"
fi

# Jalankan hyprpaper jika belum jalan
if ! pgrep -x hyprpaper >/dev/null; then
  exec hyprpaper
fi
