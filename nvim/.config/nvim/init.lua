local vim = vim
vim.g.mapleader = ' '
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.signcolumn = 'yes'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.list = true
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.colorcolumn = '80'
vim.opt.guicursor = ''
vim.opt.scrolloff = 10
vim.opt.termguicolors = true
vim.opt.foldlevelstart = 99
vim.opt.clipboard = 'unnamedplus'
vim.pack.add {
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/stevearc/conform.nvim',
  'https://github.com/zbirenbaum/copilot.lua',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/mfussenegger/nvim-lint',
  'https://github.com/nvim-treesitter/nvim-treesitter',
}
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
require('mini.pick').setup()
require('mini.icons').setup()
require('mini.pairs').setup()
require('mini.extra').setup()
require('mini.notify').setup()
require('mini.surround').setup()
require('mini.cursorword').setup()
require('mini.completion').setup()
require('oil').setup()
require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = { 'pyright', 'lua_ls', 'html', 'cssls', 'ts_ls', 'dockerls', 'angularls' },
}
vim.lsp.enable 'pyright'
vim.lsp.config('pyright', {
  settings = { python = { analysis = { typeCheckingMode = 'off' } } },
  capabilities = { textDocument = { publishDiagnostics = { tagSupport = { valueSet = { 2 } } } } },
})
require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
    return { timeout_ms = 2000, lsp_format = 'fallback' }
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'isort', 'black', 'reorder-python-imports' },
    css = { 'prettier' },
    html = { 'prettier' },
    htmlangular = { 'prettier' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescriptreact = { 'prettier' },
  },
  formatters = {
    stylua = {
      inherit = true,
      -- stylua: ignore
      append_args = {
        '--column-width', '110', '--line-endings', 'Unix', '--indent-type',
        'Spaces', '--indent-width', '2', '--quote-style', 'AutoPreferSingle',
        '--call-parentheses', 'None', '--collapse-simple-statement', 'Always',
      },
    },
  },
}
require('copilot').setup {
  copilot_node_command = vim.fn.expand '$HOME'
    .. '/.local/share/fnm/node-versions/v25.6.1/installation/bin/node',
  suggestion = { enabled = true, auto_trigger = true, keymap = { accept = '<C-a>' } },
}
require('gitsigns').setup {
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
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>hD', function() gitsigns.diffthis '~' end)
  end,
}
require('lint').linters_by_ft = {
  python = { 'flake8' },
  javascript = { 'eslint' },
  typescript = { 'eslint' },
  javascriptreact = { 'eslint' },
  typescriptreact = { 'eslint' },
}
-- stylua: ignore
require('nvim-treesitter').install({
  'javascript', 'typescript', 'tsx', 'python', 'c', 'bash', 'dockerfile',
  'vim', 'vimdoc', 'lua', 'luadoc', 'diff', 'html', 'markdown', 'css', 'yaml',
})
vim.keymap.set('n', '<Esc>', ':nohlsearch<cr>')
vim.keymap.set('n', '<C-w><S-j>', ':resize -5<cr>')
vim.keymap.set('n', '<C-w><S-k>', ':resize +5<cr>')
vim.keymap.set('n', '<C-w><S-l>', ':vertical resize -5<cr>')
vim.keymap.set('n', '<C-w><S-h>', ':vertical resize +5<cr>')
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>hh', ':Pick help<cr>')
vim.keymap.set('n', '<leader>sf', ':Pick files<cr>')
vim.keymap.set('n', '<leader>sk', ':Pick keymaps<cr>')
vim.keymap.set('n', '<leader>sb', ':Pick buffers<cr>')
vim.keymap.set('n', '<leader>s.', ':Pick oldfiles<cr>')
vim.keymap.set('n', '<leader>sc', ':Pick git_hunks<cr>')
vim.keymap.set('n', '<leader>sp', ':Pick registers<cr>')
vim.keymap.set('n', '<leader>sd', ':Pick diagnostic<cr>')
vim.keymap.set('n', '<leader>sg', ':Pick grep_live tool="rg"<cr>')
vim.keymap.set('n', '<leader>sz', ':Pick buf_lines scope="current"<cr>')
vim.keymap.set('n', '<leader>sh', ":Pick git_hunks path='%' n_context=0<cr>")
vim.keymap.set('n', '-', ':Oil<cr>')
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
})
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(e)
    local function map(l, r) vim.keymap.set('n', l, r, { buffer = e.buf }) end
    map('gd', vim.lsp.buf.definition)
    map('<leader>rn', vim.lsp.buf.rename)
    map('<leader>ca', vim.lsp.buf.code_action)
    map('gr', ':Pick lsp scope="references"<cr>')
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
vim.api.nvim_create_autocmd({ 'BufEnter', 'TextChanged', 'InsertLeave' }, {
  callback = function() require('lint').try_lint(nil, { ignore_errors = true }) end,
})
