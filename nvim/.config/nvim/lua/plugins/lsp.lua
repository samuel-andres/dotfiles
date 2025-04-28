return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = { 'LspInfo', 'LspInstall', 'LspUninstall' },
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'saghen/blink.cmp',
    { 'kevinhwang91/nvim-ufo', dependencies = { 'kevinhwang91/promise-async' } },
  },
  config = function()
    local capabilities = {
      textDocument = {
        foldingRange = {
          lineFoldingOnly = true,
          dynamicRegistration = false,
        },
      },
    }
    capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

    local servers = {
      pyright = {
        capabilities = { textDocument = { publishDiagnostics = { tagSupport = { valueSet = { 2 } } } } },
        settings = { python = { analysis = { typeCheckingMode = 'off' } } },
      },
      lua_ls = { settings = { Lua = { completion = { callSnippet = 'Replace' } } } },
    }

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, { 'stylua', 'html-lsp', 'css-lsp', 'ts_ls', 'dockerls', 'angular-language-server' })

    require('mason-tool-installer').setup { ensure_installed = ensure_installed }
    require('mason-lspconfig').setup {
      ensure_installed = {},
      automatic_installation = false,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
    require('ufo').setup()
  end,
}
