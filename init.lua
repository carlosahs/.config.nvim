require("config.lazy")
require("lsp")

vim.cmd("colorscheme tokyonight-storm")

vim.o.mouse = ""

vim.o.number = true
vim.o.relativenumber = true

vim.o.clipboard = "unnamedplus"

vim.o.cursorline = true

vim.o.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.g.have_nerd_font = false

vim.keymap.set("n", "<leader>j^", "<c-w>_", { silent = true })
vim.keymap.set("n", "<leader>j<", "<c-w>|", { silent = true })

vim.keymap.set("n", "<leader>j", "<c-w>", { silent = true })
vim.keymap.set("n", "<leader>j-", "<c-w>s", { silent = true })
vim.keymap.set("n", "<leader>j|", "<c-w>v", { silent = true })


vim.keymap.set("n", "<leader>k", "<cmd>tabnew<CR>", { silent = true })

vim.keymap.set("n", "<leader>h", "<cmd>Ex<CR>", { silent = true })

vim.keymap.set("n", "<leader>dk", "Dk$p", { silent = true })
vim.keymap.set("n", "<leader>dj", "Dj$p", { silent = true })

local tab_config = {
  [2] = {"*.lua", "*.html"},
  [4] = {"*.ts", "*.js", "*.rs"},
  [8] = {"*.go"}
}
for n, pattern in pairs(tab_config) do
  vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = pattern,
    group = vim.api.nvim_create_augroup(
      string.format("my-indent-rules-%d", n),
      { clear = false }
    ),
    callback = function(ev)
      vim.bo[ev.buf].tabstop = n
      vim.bo[ev.buf].shiftwidth = n
      vim.bo[ev.buf].softtabstop = 0
      vim.bo[ev.buf].expandtab = true
    end,
  })
end

vim.o.completeopt = "menu,menuone,noinsert"

