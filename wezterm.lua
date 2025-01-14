local wezterm = require 'wezterm'

-- Define color palettes for Catppuccin
local colors = {
    latte = {
        rosewater = "#dc8a78",
        flamingo = "#dd7878",
        pink = "#ea76cb",
        mauve = "#8839ef",
        red = "#d20f39",
        maroon = "#e64553",
        peach = "#fe640b",
        yellow = "#df8e1d",
        green = "#40a02b",
        teal = "#179299",
        sky = "#04a5e5",
        sapphire = "#209fb5",
        blue = "#1e66f5",
        lavender = "#7287fd",
        text = "#4c4f69",
        subtext1 = "#5c5f77",
        subtext0 = "#6c6f85",
        overlay2 = "#7c7f93",
        overlay1 = "#8c8fa1",
        overlay0 = "#9ca0b0",
        surface2 = "#acb0be",
        surface1 = "#bcc0cc",
        surface0 = "#ccd0da",
        crust = "#dce0e8",
        mantle = "#e6e9ef",
        base = "#eff1f5",
    },
    mocha = {
        rosewater = "#f5e0dc",
        flamingo = "#f2cdcd",
        pink = "#f5c2e7",
        mauve = "#cba6f7",
        red = "#f38ba8",
        maroon = "#eba0ac",
        peach = "#fab387",
        yellow = "#f9e2af",
        green = "#a6e3a1",
        teal = "#94e2d5",
        sky = "#89dceb",
        sapphire = "#74c7ec",
        blue = "#89b4fa",
        lavender = "#b4befe",
        text = "#cdd6f4",
        subtext1 = "#bac2de",
        subtext0 = "#a6adc8",
        overlay2 = "#9399b2",
        overlay1 = "#7f849c",
        overlay0 = "#6c7086",
        surface2 = "#585b70",
        surface1 = "#45475a",
        surface0 = "#313244",
        base = "#101021",
        mantle = "#0A0A19",
        crust = "#0A0A19",
    },
}

-- Function to select color based on the flavor
local function select_color(flavor)
    return colors[flavor]
end

-- Apply the selected color scheme
local selected_flavor = "mocha" -- Change this to the desired flavor (latte, frappe, macchiato, mocha)
local selected_colors = select_color(selected_flavor)

-- Define wallpapers
local wallpapers = {
    "/10.jpg",
    "/11.jpg",
    "/13.jpg",
    "/1.jpeg",
    "/1.png",
    "/2.jpg",
    "/3.jpg",
    "/5.jpeg",
    "/6.jpeg",
    "/7.png",
    "/8.png",
    "/10.png",
    "/12.jpg",
    "/14.jpg",
    "/1.jpg",
    "/2.jpeg",
    "/3.jpeg",
    "/4.jpeg",
    "/5.jpg",
    "/6.jpg",
    "/8.jpeg",
    "/9.png",
}

Current_wallpaper_index = 10 -- Start at the first wallpaper

-- Function to cycle wallpapers
wezterm.on('cycle-wallpaper-fw', function(window, pane)
    local overrides = window:get_config_overrides() or {}
    Current_wallpaper_index = (Current_wallpaper_index % #wallpapers) + 1
    overrides.background = {
        {
            source = {
                -- TODO: change user to fit your own username
                File = "/home/ivan/.config/wezterm" .. wallpapers[Current_wallpaper_index],
            },
            hsb = { brightness = 0.05 },
        },
    }
    window:set_config_overrides(overrides)
end)

wezterm.on('cycle-wallpaper-bw', function(window, pane)
    local overrides = window:get_config_overrides() or {}
    Current_wallpaper_index = (Current_wallpaper_index % #wallpapers) - 1
    overrides.background = {
        {
            source = {
                File = "/home/ivan/.config/wezterm" .. wallpapers[Current_wallpaper_index],
            },
            hsb = { brightness = 0.05 },
        },
    }
    window:set_config_overrides(overrides)
end)

return {
    default_prog = { '/usr/bin/fish', '-l' },
    font_size = 16.0,
    font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
    window_background_opacity = 1,
    background = {
        {
            source = {
                File = "/home/ivan/.config/wezterm" .. wallpapers[Current_wallpaper_index],
            },
            hsb = { brightness = 0.05 },
        },
    },

    colors = {
        background = selected_colors.base,
        foreground = selected_colors.text,
        cursor_bg = selected_colors.rosewater,
        cursor_fg = selected_colors.crust,

        -- ANSI colors
        ansi = {
            selected_colors.subtext1,
            selected_colors.red,
            selected_colors.green,
            selected_colors.yellow,
            selected_colors.blue,
            selected_colors.pink,
            selected_colors.teal,
            selected_colors.surface1,
        },

        brights = {
            selected_colors.surface2,
            selected_colors.red,
            selected_colors.green,
            selected_colors.yellow,
            selected_colors.blue,
            selected_colors.pink,
            selected_colors.teal,
            selected_colors.subtext0,
        },

        indexed = { [16] = selected_colors.peach, [17] = selected_colors.rosewater },
    },

    keys = {
        {
            key = ']',
            mods = 'CTRL',
            action = wezterm.action.EmitEvent 'cycle-wallpaper-fw',
        },
        {
            key = '[',
            mods = 'CTRL',
            action = wezterm.action.EmitEvent 'cycle-wallpaper-bw',
        },
    },
}
