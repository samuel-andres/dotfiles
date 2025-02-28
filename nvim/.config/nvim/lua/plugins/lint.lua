return {
  'mfussenegger/nvim-lint',
  event = 'BufEnter',
  config = function()
    local lint = require 'lint'
    lint.linters_by_ft = {
      python = { 'flake8' },
      javascript = { 'eslint' },
      typescript = { 'eslint' },
      javascriptreact = { 'eslint' },
      typescriptreact = { 'eslint' },
    }
    vim.api.nvim_create_autocmd({ 'BufEnter', 'TextChanged', 'InsertLeave' }, {
      callback = function() lint.try_lint(nil, { ignore_errors = true }) end,
    })
  end,
}
