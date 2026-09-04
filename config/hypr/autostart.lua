-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd(os.getenv("HOME") .. "/.dotfiles/scripts/wallpaper.sh")
    hl.exec_cmd("waybar")
    hl.exec_cmd("dunst")
end)
