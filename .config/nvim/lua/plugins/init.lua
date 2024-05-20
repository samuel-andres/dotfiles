return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                -- lua
                "lua-language-server",
                "stylua",
                -- html
                "html-lsp",
                -- css
                "css-lsp",
                -- js/ts
                "typescript-language-server",
                "prettier",
                "eslint-lsp",
                -- python
                "pyright",
            },
        },
    },
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        config = function()
            print "configuring copilot"
            require("copilot").setup {
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    keymap = {
                        accept = "<C-l>",
                    },
                },
            }
        end,
    },
    {
        "rmagatti/auto-session",
        lazy = false,
        config = function()
            require("auto-session").setup {
                pre_save_cmds = { "NvimTreeClose" },
                save_extra_cmds = {
                    "NvimTreeOpen",
                },
            }
        end,
    },
}
