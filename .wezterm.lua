local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- settings
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.font_size = 14
config.animation_fps = 240
config.default_cursor_style = 'BlinkingBar'
config.max_fps = 240
config.scrollback_lines = 10000
config.enable_scroll_bar = false

-- set theme by system theme
-- (probably only works on cosmic and gnome)
-- uwu
local handle = io.popen("dconf read /org/gnome/desktop/interface/color-scheme")
if handle == nil then
    config.color_scheme = 'Catppuccin Frappe'
    config.window_background_opacity = 0.8
else
    local scheme = handle:read("*a"):gsub("%s+", "")
    handle:close()
    if scheme == "'prefer-dark'" then
        config.color_scheme = 'Catppuccin Frappe'
        config.window_background_opacity = 0.8
    elseif scheme == "'prefer-light'" then
        config.color_scheme = 'Catppuccin Latte'
        config.window_background_opacity = 0.8
    else
        config.color_scheme = 'Catppuccin Frappe'
        config.window_background_opacity = 0.8
    end
end

config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font 'JetBrainsMono'
config.window_decorations = "NONE"

-- binds
config.keys = {
        {key="t", mods="ALT", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
        {key="a", mods="ALT", action=wezterm.action{ActivateTabRelative=-1}},
        {key="d", mods="ALT", action=wezterm.action{ActivateTabRelative=1}},
        {key="b", mods="ALT", action=wezterm.action.SplitHorizontal},
        {key="v", mods="ALT", action=wezterm.action.SplitVertical},
        {
            key = 'h',
            mods = 'ALT',
            action = wezterm.action.ActivatePaneDirection 'Left',
        },
        {
            key = 'l',
            mods = 'ALT',
            action = wezterm.action.ActivatePaneDirection 'Right',
        },
        {
            key = 'k',
            mods = 'ALT',
            action = wezterm.action.ActivatePaneDirection 'Up',
        },
        {
            key = 'j',
            mods = 'ALT',
            action = wezterm.action.ActivatePaneDirection 'Down',
        },
        { key = "h", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize { 'Left', 1 } },
        { key = "j", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize { 'Down', 1 } },
        { key = "k", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize { 'Up', 1 } },
        { key = "l", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize { 'Right', 1 } },
        { key = "F11", mods = "", action = wezterm.action.ToggleFullScreen }
}

config.unix_domains = {
  {
    name = 'unix',
  },
}


return config
