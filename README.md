# dotfiles

Hyprland config and related tools running on Arch Linux.

## What's here

| Directory        | What                                                                                                  |
| ---------------- | ----------------------------------------------------------------------------------------------------- |
| `config/hypr/`   | Hyprland compositor config split into Lua modules (keybinds, rules, animations, theme, layouts, etc.) |
| `config/waybar/` | Waybar status bar (JSONC config + CSS)                                                                |
| `config/kitty/`  | Kitty terminal config                                                                                 |
| `config/dunst/`  | Dunst notification daemon config                                                                      |
| `scripts/`       | Utility scripts for volume, brightness, bluetooth, and wifi controls                                  |

## Dependencies

- **Hyprland** (window manager)
- **Waybar** (status bar)
- **Kitty** (terminal)
- **Dunst** (notifications)
- **Rofi** (app launcher)
- **NetworkManager** (network management)
- **Bluez** (bluetooth)
- **Hyprshot** (screenshots)
- **ttf-jetbrains-mono-nerd** (monospace font)
- **Zsh** (shell)

## Quick start

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/seaavey/dotfiles/main/install.sh)"
```

## Scripts

| Script                      | Purpose                                     |
| --------------------------- | ------------------------------------------- |
| `scripts/volume.sh`         | Volume up/down/mute via wpctl               |
| `scripts/brightness.sh`     | Screen brightness control via brightnessctl |
| `scripts/bluetooth-menu.sh` | Bluetooth device pairing menu               |
| `scripts/wifi-menu.sh`      | Wifi network selection menu                 |
| `scripts/reload-waybar.sh`  | Reload Waybar config on the fly             |

## Notes

- Hyprland config uses the Lua-based `hyprland.conf` loader (the `hl` globals
  are provided by the compositor at runtime). The `.luarc.json` at the repo root
  tells the Lua language server about `hl` so you get proper autocomplete.
- `.prettierrc` exists to handle the `.jsonc` files without trailing commas,
  since JSONC isn't strictly valid JSON and Prettier's default JSON parser
  chokes on it.
