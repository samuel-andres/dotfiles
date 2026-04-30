local vim = vim
vim.g.mapleader = " "

-- ============================================================================
-- Options
-- ============================================================================

-- UI and editing behavior
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 10
vim.opt.colorcolumn = "80"
vim.opt.guicursor = ""
vim.opt.termguicolors = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

-- Files and backups
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.writebackup = false

-- Indentation and whitespaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 99

-- Share system clipboard
vim.opt.clipboard = "unnamedplus"

-- ============================================================================
-- Plugins
-- ============================================================================

vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/neovim/nvim-lspconfig",
})

-- Mini.nvim modules
require("mini.diff").setup({
	view = {
		style = "sign",
		signs = { add = "+", change = "~", delete = "_" },
	},
})
require("mini.base16").setup({
	-- stylua: ignore
	palette = {
		base00 = "#32302f", base01 = "#3c3836", base02 = "#5a524c",
		base03 = "#7c6f64", base04 = "#bdae93", base05 = "#ddc7a1",
		base06 = "#ebdbb2", base07 = "#fbf1c7", base08 = "#ea6962",
		base09 = "#e78a4e", base0A = "#d8a657", base0B = "#a9b665",
		base0C = "#89b482", base0D = "#7daea3", base0E = "#d3869b",
		base0F = "#bd6f3e",
	},
})
require("mini.pick").setup()
require("mini.pairs").setup()
require("mini.extra").setup()
require("mini.notify").setup()
require("mini.surround").setup()
require("mini.cursorword").setup()
require("mini.completion").setup()

-- File explorer
require("oil").setup()

-- ============================================================================
-- LSP
-- ============================================================================

vim.lsp.config("ty", { settings = { ty = { diagnosticMode = "off" } } })
vim.lsp.enable({ "ty", "tsgo", "rust_analyzer", "lua_ls" })

-- ============================================================================
-- Keymappings
-- ============================================================================

vim.keymap.set("n", "<Esc>", ":nohlsearch<cr>")

-- Window resizing
vim.keymap.set("n", "<C-w><S-j>", ":resize -5<cr>")
vim.keymap.set("n", "<C-w><S-k>", ":resize +5<cr>")
vim.keymap.set("n", "<C-w><S-l>", ":vertical resize -5<cr>")
vim.keymap.set("n", "<C-w><S-h>", ":vertical resize +5<cr>")

-- Diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Mini.pick
vim.keymap.set("n", "<leader>hh", ":Pick help<cr>")
vim.keymap.set("n", "<leader>sf", ":Pick files<cr>")
vim.keymap.set("n", "<leader>sk", ":Pick keymaps<cr>")
vim.keymap.set("n", "<leader>sb", ":Pick buffers<cr>")
vim.keymap.set("n", "<leader>s.", ":Pick oldfiles<cr>")
vim.keymap.set("n", "<leader>sc", ":Pick git_hunks<cr>")
vim.keymap.set("n", "<leader>sp", ":Pick registers<cr>")
vim.keymap.set("n", "<leader>sd", ":Pick diagnostic<cr>")
vim.keymap.set("n", "<leader>sg", ':Pick grep_live tool="rg"<cr>')
vim.keymap.set("n", "<leader>sz", ':Pick buf_lines scope="current"<cr>')
vim.keymap.set("n", "<leader>sh", ":Pick git_hunks path='%' n_context=0<cr>")

-- Git hunk operations
vim.keymap.set("n", "<leader>hr", "gHgh", { remap = true, desc = "Reset hunk" })
vim.keymap.set("n", "<leader>hR", function()
	local cursor = vim.api.nvim_win_get_cursor(0)
	vim.cmd("normal 1GgHG")
	pcall(vim.api.nvim_win_set_cursor, 0, cursor)
end, { desc = "Reset buffer" })

-- File explorer
vim.keymap.set("n", "-", ":Oil<cr>")

-- ============================================================================
-- Commands
-- ============================================================================

vim.api.nvim_create_user_command("Diff", ":lua MiniDiff.toggle_overlay()", {})
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(e)
		local function map(l, r)
			vim.keymap.set("n", l, r, { buffer = e.buf })
		end
		map("gd", vim.lsp.buf.definition)
		map("<leader>rn", vim.lsp.buf.rename)
		map("<leader>ca", vim.lsp.buf.code_action)
		map("<leader>sr", ':Pick lsp scope="references" <cr>')
	end,
})
