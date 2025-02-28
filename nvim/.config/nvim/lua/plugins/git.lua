return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    current_line_blame_opts = { delay = 100 },
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'
      local function map(mode, l, r) vim.keymap.set(mode, l, r, { buffer = bufnr }) end
      map('n', '<leader>hd', gitsigns.diffthis)
      map('n', '<leader>hs', gitsigns.stage_hunk)
      map('n', '<leader>hr', gitsigns.reset_hunk)
      map('n', '<leader>hb', gitsigns.blame_line)
      map('n', '<leader>hS', gitsigns.stage_buffer)
      map('n', '<leader>hR', gitsigns.reset_buffer)
      map('n', '<leader>hp', gitsigns.preview_hunk)
      map('n', '<leader>tD', gitsigns.toggle_deleted)
      map('n', '<leader>hu', gitsigns.undo_stage_hunk)
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
      map('n', '<leader>hD', function() gitsigns.diffthis '~' end)
    end,
  },
}
