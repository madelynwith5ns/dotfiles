-- follow system theme
-- i don't know if this'll work outside of COSMIC and GNOME,
-- i'd assume not since its reading a gnome setting
-- but cosmic isn't gnome anymore and it still sets this sooo
-- it works on my machine :3
local handle = io.popen("dconf read /org/gnome/desktop/interface/color-scheme")
local theme;
if handle == nil then
    theme = "frappe"
else
    local scheme = handle:read("*a"):gsub("%s+", "")
    handle:close()
    if scheme == "'prefer-dark'" then
        theme = "frappe"
    elseif scheme == "'prefer-light'" then
        theme = "latte"
    else
        theme = "frappe"
    end
end

require("catppuccin").setup({
    flavour = theme, -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "macchiato",
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

vim.cmd.colorscheme "catppuccin"
