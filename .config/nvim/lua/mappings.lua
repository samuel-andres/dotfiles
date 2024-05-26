-- nvchad mappings
require "nvchad.mappings"

-- remove unused mappings
vim.keymap.del("n", "<leader>v")
vim.keymap.del("n", "<leader>h")
vim.keymap.del("n", "<leader>b")
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-l>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")

-- custom core mappings
vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>od", function()
    vim.diagnostic.open_float()
end)

-- custom nvim-tree mappings
vim.keymap.set(
    "n",
    "<C-b>",
    "<cmd>NvimTreeToggle<CR>",
    { desc = "nvimtree toggle window" }
)

-- custom telescope mappings
vim.keymap.set(
    "n",
    "<leader>fk",
    "<cmd>Telescope keymaps<CR>",
    { desc = "Telescope keymaps" }
)
vim.keymap.set(
    "n",
    "<leader>fh",
    "<cmd> Telescope git_signs<CR>",
    { desc = "Telescope find hunk" }
)
vim.keymap.set(
    "n",
    "<leader>fd",
    "<cmd>Telescope git_status<CR>",
    { desc = "Telescope find diff" }
)

-- custom oil mappings
vim.keymap.set(
    "n",
    "-",
    "<CMD>Oil --float<CR>",
    { desc = "Open parent directory" }
)

-- custom diffview mappings
vim.keymap.set(
    "n",
    "<leader>dfo",
    "<cmd>DiffviewOpen<CR>",
    { desc = "Open diff view" }
)
vim.keymap.set(
    "n",
    "<leader>dfc",
    "<cmd>DiffviewClose<CR>",
    { desc = "Close diff view" }
)


-- custom gitsigns mappings
vim.keymap.set(
    "n",
    "<leader>hp",
    "<cmd>Gitsigns prev_hunk<CR>",
    { desc = "Prev hunk" }
)
vim.keymap.set(
    "n",
    "<leader>hn",
    "<cmd>Gitsigns next_hunk<CR>",
    { desc = "Next hunk" }
)
vim.keymap.set(
    "n",
    "<leader>hv",
    "<cmd>Gitsigns preview_hunk<CR>",
    { desc = "Preview hunk" }
)
vim.keymap.set(
    "n",
    "<leader>lb",
    "<cmd>Gitsigns blame_line<CR>",
    { desc = "Blame line" }
)
vim.keymap.set(
    "n",
    "<leader>hr",
    "<cmd>Gitsigns reset_hunk<CR>",
    { desc = "Reset hunk" }
)
vim.keymap.set(
    "n",
    "<leader>bd",
    "<cmd>Gitsigns diffthis<CR>",
    { desc = "Diff buffer" }
)
vim.keymap.set(
    "n",
    "<leader>bs",
    "<cmd>Gitsigns stage_buffer<CR>",
    { desc = "Stage buffer" }
)
vim.keymap.set(
    "n",
    "<leader>br",
    "<cmd>Gitsigns reset_buffer<CR>",
    { desc = "Reset buffer" }
)
vim.keymap.set(
    "n",
    "<leader>hs",
    "<cmd>Gitsigns stage_hunk<CR>",
    { desc = "Stage hunk" }
)
vim.keymap.set(
    "n",
    "<leader>hu",
    "<cmd>Gitsigns undo_stage_hunk<CR>",
    { desc = "Undo stage hunk" }
)

-- custom tmux navigator mappings
vim.keymap.set(
    "n",
    "<C-h>",
    "<cmd>TmuxNavigateLeft<CR>",
    { desc = "Tmux navigate left" }
)
vim.keymap.set(
    "n",
    "<C-j>",
    "<cmd>TmuxNavigateDown<CR>",
    { desc = "Tmux navigate down" }
)
vim.keymap.set(
    "n",
    "<C-k>",
    "<cmd>TmuxNavigateUp<CR>",
    { desc = "Tmux navigate up" }
)
vim.keymap.set(
    "n",
    "<C-l>",
    "<cmd>TmuxNavigateRight<CR>",
    { desc = "Tmux navigate right" }
)
