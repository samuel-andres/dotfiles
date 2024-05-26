-- nvchad mappings
require "nvchad.mappings"

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
    "<C-e>",
    "<cmd>Telescope buffers<CR>",
    { desc = "Telescope buffers" }
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
