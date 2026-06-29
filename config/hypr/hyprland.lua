-- Hyprland Config (Modular)

-- Monitor
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

-- Load modules
require("variables")
require("autostart")
require("env")
require("theme")
require("input")
require("keybinds")
require("rules")
require("layouts")
require("misc")
