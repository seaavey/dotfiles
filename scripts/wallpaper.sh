#!/usr/bin/env bash
set -euo pipefail

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
FALLBACK_FILE="$WALLPAPER_DIR/wallpaper.jpg"

mkdir -p "$WALLPAPER_DIR"

# Cari file wallpaper di direktori
get_wallpaper() {
  find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.webp" \) | head -n 1
}

# Jika belum ada wallpaper sama sekali, download fallback
if [[ -z "$(get_wallpaper)" ]]; then
  echo "Wallpaper tidak ditemukan di $WALLPAPER_DIR. Mengunduh fallback wallpaper..."
  curl -sL "https://picsum.photos/2560/1440" -o "$FALLBACK_FILE"
fi

WP_PATH="$(get_wallpaper)"
[[ -z "$WP_PATH" ]] && WP_PATH="$FALLBACK_FILE"

# Matikan instance lama jika ada, lalu jalankan swaybg
killall swaybg 2>/dev/null || true
exec swaybg -i "$WP_PATH" -m fill
