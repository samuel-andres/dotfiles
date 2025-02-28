return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = { 'LspInfo', 'LspInstall', 'LspUninstall' },
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'hrsh7th/cmp-nvim-lsp',
    { 'kevinhwang91/nvim-ufo', dependencies = { 'kevinhwang91/promise-async' } },
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

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
