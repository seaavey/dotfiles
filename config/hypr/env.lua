-- Environment Variables
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_DATA_DIRS", "/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:~/.local/share/flatpak/exports/share")

-- GTK Theme
hl.env("GTK_THEME", "Catppuccin-Mocha")
hl.env("ICON_THEME", "Papirus-Dark")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")

-- Hardware Acceleration & Firefox Wayland
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("LIBVA_DRIVER_NAME", "iHD")
