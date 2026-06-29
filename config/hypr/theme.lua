-- General, Decoration, Animations

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 20,

        border_size = 0,

        col = {
            active_border   = { colors = {"rgba(89b4faee)", "rgba(cba6f7ee)"}, angle = 135 },
            inactive_border = "rgba(45475aaa)",
        },

        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = false,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Bezier curves
hl.curve("smooth",        { type = "bezier", points = { {0.25, 0.1},  {0.25, 1}    } })
hl.curve("overshot",      { type = "bezier", points = { {0.13, 0.99}, {0.29, 1.15} } })
hl.curve("easeInOutQuart",{ type = "bezier", points = { {0.76, 0},    {0.24, 1}    } })
hl.curve("easeOutExpo",   { type = "bezier", points = { {0.16, 1},    {0.3, 1}     } })
hl.curve("easeOutQuint",  { type = "bezier", points = { {0.22, 1},    {0.36, 1}    } })
hl.curve("linear",        { type = "bezier", points = { {0, 0},       {1, 1}       } })

-- Window animations
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 6,    bezier = "overshot",      style = "popin 80%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 5,    bezier = "easeOutExpo",   style = "popin 80%" })
hl.animation({ leaf = "windowsMove",   enabled = true,  speed = 5,    bezier = "overshot" })

-- Fade animations
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 4,    bezier = "easeOutExpo" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 4,    bezier = "easeOutExpo" })
hl.animation({ leaf = "fadeSwitch",    enabled = true,  speed = 4,    bezier = "easeOutExpo" })
hl.animation({ leaf = "fadeShadow",    enabled = true,  speed = 4,    bezier = "easeOutExpo" })
hl.animation({ leaf = "fadeDim",       enabled = true,  speed = 4,    bezier = "easeOutExpo" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 4,    bezier = "easeOutExpo" })

-- Border animations
hl.animation({ leaf = "border",        enabled = true,  speed = 10,   bezier = "smooth" })
hl.animation({ leaf = "borderangle",   enabled = true,  speed = 100,  bezier = "linear",        style = "loop" })

-- Layer animations
hl.animation({ leaf = "layers",        enabled = true,  speed = 5,    bezier = "easeOutExpo" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 5,    bezier = "easeOutExpo",   style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 4,    bezier = "easeOutExpo",   style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 5,    bezier = "easeOutExpo" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 4,    bezier = "easeOutExpo" })

-- Workspace animations
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 6,    bezier = "overshot",      style = "slide" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 5,    bezier = "overshot",      style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 5,    bezier = "overshot",      style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 6,  bezier = "overshot",      style = "slidevert" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 10,   bezier = "smooth" })
