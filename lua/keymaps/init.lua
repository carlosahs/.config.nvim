require("keymaps.toggleterm")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>hh", "<cmd>Ex<CR>", { desc = "[H] Open [H] explorer"} )
vim.keymap.set("n", "<leader>kh", "gT", { desc = "[H] Go to [J] next [H] tab" })
vim.keymap.set("n", "<leader>kj", "<cmd>tabnew<CR>", { desc = "[H] Open [J] new [J] tab" })
vim.keymap.set("n", "<leader>kl", "gt", { desc = "[H] Go to [J] next [L] tab" })
vim.keymap.set("n", "<leader>j", "<c-w>", { silent = true })

