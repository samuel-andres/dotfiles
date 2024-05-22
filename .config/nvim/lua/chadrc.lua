---@type ChadrcConfig
local M = {}

M.ui = {
    theme = "doomchad",
    transparency = true,
    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
    statusline = {
        separator_style = "block",
    },
    cheatsheet = {
        theme = "simple",
    },
    tabufline = {
        enabled = false,
    },
}

return M
