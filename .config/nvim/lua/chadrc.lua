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
        theme = "default",
        order = {
            "mode",
            "relativepath",
            "file",
            "savestatus",
            "git",
            "%=",
            "lsp_msg",
            "%=",
            "diagnostics",
            "lsp",
            "cwd",
            "cursor",
        },
        modules = {
            relativepath = function()
                vim.cmd "highlight St_relativepath guifg=#626a83 guibg=#2a2b36"
                local path = vim.api.nvim_buf_get_name(
                    vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
                )
                if path == "" then
                    return ""
                end
                -- use a glyph to indicate the relative path instead of ">"
                return ("%#St_relativepath# " .. vim.fn.expand "%:.:h" .. "/"):gsub(
                    "/",
                    "  "
                )
            end,
            savestatus = function()
                vim.cmd "highlight St_savestatus guifg=#61afef guibg=#2a2b36"
                if
                    vim.bo[vim.api.nvim_win_get_buf(
                        vim.g.statusline_winid or 0
                    )].modified
                then
                    -- use the best nerdfont glyph to indicate
                    -- that the buffer is modified and needs saving
                    return "%#St_savestatus#  "
                end
                return ""
            end,
        },
    },
    cheatsheet = {
        theme = "simple",
    },
    tabufline = {
        enabled = false,
    },
}

return M
