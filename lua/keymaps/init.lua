require("keymaps.toggleterm")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>hh", "<cmd>Ex<CR>", { desc = "[H] Open [H] explorer"} )
vim.keymap.set("n", "<leader>j", "<c-w>", { silent = true })

