return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'saghen/blink.cmp',
    { 'kevinhwang91/nvim-ufo', dependencies = { 'kevinhwang91/promise-async' } },
  },
  config = function()
    vim.lsp.config('pyright', {
      settings = { python = { analysis = { typeCheckingMode = 'off' } } },
      capabilities = { textDocument = { publishDiagnostics = { tagSupport = { valueSet = { 2 } } } } },
    })
    require('mason-lspconfig').setup { ensure_installed = { 'pyright', 'lua_ls', 'html', 'cssls', 'ts_ls', 'dockerls', 'angularls' } }
    require('ufo').setup()
  end,
}
