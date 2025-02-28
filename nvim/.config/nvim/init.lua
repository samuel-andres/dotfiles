-- [[ Options ]]
vim.g.mapleader = ' '
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.scrolloff = 10
vim.opt.wrap = false
vim.opt.colorcolumn = '80'
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.foldcolumn = '0'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.guicursor = ''
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)

-- [[ Autocommands ]]
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
    map('gI', ':Pick lsp scope="implementation"<cr>')
    map('<leader>D', ':Pick lsp scope="type_definition"<cr>')
    map('<leader>ds', ':Pick lsp scope="document_symbol"<cr>')
    map('<leader>ws', ':Pick lsp scope="workspace_symbol"<cr>')
  end,
})

-- [[ Keymaps ]]
vim.keymap.set('n', '<Esc>', ':nohlsearch<cr>')
vim.keymap.set('n', '<C-w><S-j>', ':resize -5<cr>')
vim.keymap.set('n', '<C-w><S-k>', ':resize +5<cr>')
vim.keymap.set('n', '<C-w><S-l>', ':vertical resize -5<cr>')
vim.keymap.set('n', '<C-w><S-h>', ':vertical resize +5<cr>')
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
vim.keymap.set('n', 'd]', function() vim.diagnostic.jump { count = 1, float = true } end)
vim.keymap.set('n', '[d', function() vim.diagnostic.jump { count = -1, float = true } end)

-- [[ Plugins ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
---@diagnostic disable-next-line: undefined-field
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then error('Error cloning lazy.nvim:\n' .. out) end
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup {
  spec = 'plugins',
  performance = { rtp = { disabled_plugins = { 'gzip', 'netrwPlugin', 'tarPlugin', 'tohtml', 'tutor', 'zipPlugin' } } },
}
