require "nvchad.mappings"

vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>od", function() vim.diagnostic.open_float() end )
vim.keymap.set("n", "<C-e>", "<cmd>Telescope buffers<CR>", { desc = "telescope live grep" })

