require("keymaps.toggleterm")

vim.keymap.set("n", "<leader>c", function()
  vim.api.nvim_buf_call(0, function()
    vim.b["cc"] = vim.b["cc"] or "80"
    vim.wo["cc"] = (vim.wo["cc"] == vim.b["cc"]) and "" or vim.b["cc"]
  end)
end)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>j", "<c-w>", { silent = true })
vim.keymap.set("n", "<leader>k", "<cmd>tabnew<CR>", { silent = true })
vim.keymap.set("n", "<leader>h", "<cmd>Ex<CR>", { silent = true })

