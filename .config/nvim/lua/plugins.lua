return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        config = function()
            local options = {
                formatters_by_ft = {
                    lua = { "stylua" },
                    css = { "prettier" },
                    html = { "prettier" },
                    typescript = { { "prettierd", "prettier" } },
                    typescriptreact = { { "prettierd", "prettier" } },
                },
            }

            require("conform").setup(options)
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            local on_attach = require("nvchad.configs.lspconfig").on_attach
            local on_init = require("nvchad.configs.lspconfig").on_init
            local capabilities = require("nvchad.configs.lspconfig").capabilities

            local lspconfig = require "lspconfig"
            local servers = { "html", "cssls", "eslint" }

            -- lsps with default config
            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup {
                    on_attach = on_attach,
                    on_init = on_init,
                    capabilities = capabilities,
                }
            end

            -- typescript
            lspconfig.tsserver.setup {
                on_attach = on_attach,
                on_init = on_init,
                capabilities = capabilities,
            }

            -- python
            lspconfig.pyright.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "python" },
            }
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
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",

                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",

                "python",
                "c",
            },
        },
    },
    {
        "sindrets/diffview.nvim",
        lazy = false,
        config = function ()
            require("diffview").setup()
        end
    },
}
