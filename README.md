
<div align="center">
  <img src="https://raw.githubusercontent.com/hyprwm/Hyprland/main/assets/header.svg" alt="Hyprland" width="120" style="border-radius: 20px">
  <h1 align="center">dotfiles</h1>
  <p align="center">
    A curated <strong>Hyprland</strong> rice — minimal, functional, yours.
    <br>
    Arch Linux · Waybar · Foot · Rofi · Dunst
  </p>
  <p align="center">
    <a href="#rocket-quick-start">Quick Start</a> •
    <a href="#open_file_folder-whats-inside">Contents</a> •
    <a href="#hammer_and_wrench-commands">Commands</a> •
    <a href="#package-dependencies">Dependencies</a>
  </p>
  <p align="center">
    <img src="https://img.shields.io/badge/OS-Arch_Linux-blue?style=flat&logo=archlinux" alt="OS">
    <img src="https://img.shields.io/badge/WM-Hyprland-ff69b4?style=flat" alt="WM">
    <img src="https://img.shields.io/badge/shell-zsh-4eaa25?style=flat&logo=gnu-bash" alt="Shell">
    <img src="https://img.shields.io/badge/terminal-foot-89b4fa?style=flat" alt="Terminal">
    <img src="https://img.shields.io/badge/license-MIT-green?style=flat" alt="License">
  </p>
</div>

---

## :rocket: Quick start

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/seaavey/dotfiles/refs/heads/master/install.sh)"
```

One command — installs everything, links configs, applies themes.  
Already cloned? Just run `dotfiles install`.

---

## :open_file_folder: What's inside

```
dotfiles/
├── bin/            ← dotfiles CLI (update, move, install)
├── config/
│   ├── hypr/       → ~/.config/hypr      — Hyprland (Lua modules)
│   ├── waybar/     → ~/.config/waybar    — Status bar (JSONC + CSS)
│   ├── foot/       → ~/.config/foot      — Terminal emulator
│   ├── dunst/      → ~/.config/dunst     — Notifications
│   ├── rofi/       → ~/.config/rofi      — App launcher (16 color themes)
│   ├── gtk-3.0/    → ~/.config/gtk-3.0   — GTK3 settings
│   ├── gtk-4.0/    → ~/.config/gtk-4.0   — GTK4 settings
│   └── fontconfig/ → ~/.config/fontconfig — Font configuration
└── scripts/        ← Utility scripts (brightness, volume, wifi, bluetooth)
```

All configs are **symlinked** — edit in the repo, changes apply instantly.

---

## :hammer_and_wrench: Commands

After install, `dotfiles` is available globally:

| Command                  | What it does                                                       |
| ------------------------ | ------------------------------------------------------------------ |
| `dotfiles install`       | Full setup — packages, symlinks, themes                            |
| `dotfiles update`        | `git pull` + re-link configs + re-apply themes                     |
| `dotfiles move hypr ...` | Move `~/.config/hypr` into repo and symlink it back (adopt a dir)  |
| `dotfiles help`          | Show usage                                                         |

---

## :package: Dependencies

| Category         | Packages                                                   |
| ---------------- | ---------------------------------------------------------- |
| **Window mgr**   | Hyprland                                                   |
| **UI/Tools**     | Waybar, Rofi, Dunst, Foot, Dolphin                         |
| **Audio**        | WirePlumber, PipeWire-Pulse, pavucontrol, playerctl        |
| **Hardware**     | brightnessctl, bluez, bluez-utils, NetworkManager          |
| **Look & feel**  | Papirus icon theme, Catppuccin GTK, Bibata cursor, JetBrains Mono Nerd |
| **Extras**       | hyprshot, gamemode, Firefox, zsh                           |

Installed automatically by `dotfiles install`.

---

## :scroll: Scripts

| Script                          | Purpose                  |
| ------------------------------- | ------------------------ |
| `scripts/volume.sh`             | Volume up/down/mute      |
| `scripts/brightness.sh`         | Screen brightness        |
| `scripts/bluetooth-menu.sh`     | Bluetooth device pairing |
| `scripts/wifi-menu.sh`          | Wi-Fi network selection  |
| `scripts/reload-waybar.sh`      | Reload Waybar on the fly |

---

## :memo: Notes

- **Hyprland** config uses Lua modules loaded by `hyprland.conf`. The `.luarc.json` at the repo root gives your LSP proper autocomplete for the `hl` globals.
- **JSONC** files need Prettier's JSON parser handled specially — `.prettierrc` saves the day.
- **Rofi** ships with 16 hand-picked color themes: from gruvbox to cyberpunk, tokyonight to everforest.
  Switch themes by editing `config/rofi/type-4/shared/colors.rasi`.

---

<p align="center">
  <sub>Made with :cherry_blossom: on Arch Linux. · Inspired by the Hyprland community.</sub>
</p>
