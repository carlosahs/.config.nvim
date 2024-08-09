require("config.lazy")
require("lsp")

vim.cmd("colorscheme tokyonight-night")

vim.o.mouse = ""

vim.o.number = true
vim.o.relativenumber = true

vim.o.clipboard = "unnamedplus"

vim.o.cursorline = true

vim.o.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.g.have_nerd_font = false

vim.keymap.set("n", "<leader>j/", "<c-w>|", { silent = true })
vim.keymap.set("n", "<leader>j", "<c-w>", { silent = true })
vim.keymap.set("n", "<leader>j-", "<c-w>s", { silent = true })
vim.keymap.set("n", "<leader>j|", "<c-w>v", { silent = true })

vim.keymap.set("n", "<leader>k", "<cmd>tabnew<CR>", { silent = true })

vim.keymap.set("n", "<leader>h", "<cmd>Ex<CR>", { silent = true })

vim.keymap.set("n", "<leader>dk", "^Dk$pjddk$", { silent = true })
vim.keymap.set("n", "<leader>dj", "j^Dk$pjddk$", { silent = true })

vim.keymap.set("t", "<c-[><c-[>", "<c-\\><c-n>")

local tab_config = {
  ["*.lua"] = {
    tabstop = 2,
    shiftwidth = 2,
    softtabstop = 0,
    expandtab = 2,
  },
  ["*.html"] = {
    tabstop = 2,
    shiftwidth = 2,
    softtabstop = 0,
    expandtab = 2,
  },
  ["*.ts"] = {
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 0,
    expandtab = 4,
  },
  ["*.js"] = {
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 0,
    expandtab = 4,
  },
  ["*.rs"] = {
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 0,
    expandtab = 4,
  },
  ["*.go"] = {
    tabstop = 8,
    shiftwidth = 0,
    softtabstop = 0,
    expandtab = false,
  },
}
for pattern, config in pairs(tab_config) do
  vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = pattern,
    group = vim.api.nvim_create_augroup(
      string.format("my-%s-indent-rules", string.gsub(pattern, "*.", "")),
      { clear = false }
    ),
    callback = function(ev)
      for key, value in pairs(config) do
        vim.bo[ev.buf][key] = value
      end
    end,
  })
end

vim.o.completeopt = "menu,menuone,noinsert"

