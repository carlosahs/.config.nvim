require("keymaps.toggleterm")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>j", "<c-w>", { silent = true })
vim.keymap.set("n", "<leader>k", "<cmd>tabnew<CR>", { silent = true })
vim.keymap.set("n", "<leader>h", "<cmd>Ex<CR>", { silent = true })

