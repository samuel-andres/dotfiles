return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    build = ':TSUpdate',
    opts = {
      -- stylua: ignore
      ensure_installed = {
        'javascript', 'typescript', 'tsx', 'python', 'c', 'bash', 'dockerfile',
        'vim', 'vimdoc', 'lua', 'luadoc', 'diff', 'html', 'markdown', 'css', 'yaml',
      },
      auto_install = true,
      indent = { enable = true },
      highlight = { enable = true },
    },
    config = function(_, opts) require('nvim-treesitter.configs').setup(opts) end,
  },
  { 'nvim-treesitter/nvim-treesitter-context', event = 'VeryLazy', opts = { multiline_threshold = 1 } },
}
