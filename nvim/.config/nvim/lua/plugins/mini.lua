return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.pick').setup()
    require('mini.icons').setup()
    require('mini.pairs').setup()
    require('mini.extra').setup()
    require('mini.notify').setup()
    require('mini.surround').setup()
    require('mini.cursorword').setup()
    require('mini.base16').setup {
        -- stylua: ignore
        palette = {
          base00 = '#32302f', base01 = '#3c3836', base02 = '#5a524c', base03 = '#7c6f64',
          base04 = '#bdae93', base05 = '#ddc7a1', base06 = '#ebdbb2', base07 = '#fbf1c7',
          base08 = '#ea6962', base09 = '#e78a4e', base0A = '#d8a657', base0B = '#a9b665',
          base0C = '#89b482', base0D = '#7daea3', base0E = '#d3869b', base0F = '#bd6f3e',
        },
    }
    local colors = require 'mini.colors'
    colors.setup()
    colors.get_colorscheme():add_transparency():apply()
    vim.keymap.set('n', '<leader>hh', ':Pick help<cr>')
    vim.keymap.set('n', '<leader>sf', ':Pick files<cr>')
    vim.keymap.set('n', '<leader>sr', ':Pick resume<cr>')
    vim.keymap.set('n', '<leader>sk', ':Pick keymaps<cr>')
    vim.keymap.set('n', '<leader>sb', ':Pick buffers<cr>')
    vim.keymap.set('n', '<leader>s.', ':Pick oldfiles<cr>')
    vim.keymap.set('n', '<leader>sc', ':Pick git_hunks<cr>')
    vim.keymap.set('n', '<leader>sp', ':Pick registers<cr>')
    vim.keymap.set('n', '<leader>sd', ':Pick diagnostic<cr>')
    vim.keymap.set('n', '<leader>sg', ':Pick grep_live tool="rg"<cr>')
    vim.keymap.set('n', '<leader>sz', ':Pick buf_lines scope="current"<cr>')
    vim.keymap.set('n', '<leader>sh', ":Pick git_hunks path='%' n_context=0<cr>")
  end,
}
