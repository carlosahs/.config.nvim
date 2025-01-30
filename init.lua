require("config.lazy")
require("lsp")

vim.cmd("colorscheme tokyonight-night")

local cc_default = "80"
vim.keymap.set("n", "<leader>c", function()
  vim.api.nvim_buf_call(0, function()
    vim.b["cc"] = vim.b["cc"] or cc_default
    vim.wo["cc"] = (vim.wo["cc"] == vim.b["cc"]) and "" or vim.b["cc"]
  end)
end)

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

vim.keymap.set("t", "<c-]><c-[>", "<c-\\><c-n>")

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", leadmultispace = "↦ " }

local tab_values = {
  ["*.lua"] = {
    tabstop = 2,
    shiftwidth = 2,
    softtabstop = 0,
    expandtab = true,
  },
  ["*.html"] = {
    tabstop = 2,
    shiftwidth = 2,
    softtabstop = 0,
    expandtab = true,
  },
  ["*.ts"] = {
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 0,
    expandtab = true,
  },
  ["*.js"] = {
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 0,
    expandtab = true,
  },
  ["*.rs"] = {
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 0,
    expandtab = true,
  },
  ["*.go"] = {
    tabstop = 8,
    shiftwidth = 0,
    softtabstop = 0,
    expandtab = false,
  },
  ["*.css"] = {
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
  },
  ["*.json"] = {
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
  },
  ["*.cpp"] = {
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
  },
}
for pattern, values in pairs(tab_values) do
  vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = pattern,
    group = vim.api.nvim_create_augroup(
      string.format("my-%s-indent-rules", string.gsub(pattern, "*.", "")),
      { clear = false }
    ),
    callback = function(ev)
      for key, value in pairs(values) do
        vim.bo[ev.buf][key] = value
        if key == "tabstop" then
          vim.wo.listchars = "leadmultispace:↦" .. string.rep(" ", value - 1) .. ",tab:» ,trail:·,nbsp:␣"
        end
      end
    end,
  })
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*",
  group = vim.api.nvim_create_augroup(
    "my-reload-rules",
    { clear = false }
  ),
  callback = function(_)
    vim.cmd("checktime")
  end
})

vim.o.completeopt = "menu,menuone,noinsert"

local cc_values = {
  ["*.ts"] = "120",
  ["*.lua"] = "120",
}
for pattern, value in pairs(cc_values) do
  vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = pattern,
    group = vim.api.nvim_create_augroup(
      string.format("cc: %s", pattern),
      { clear = false }
    ),
    callback = function(ev)
      vim.b["cc"] = value
    end,
    desc = string.format("Initalize colorcolumn value for pattern: %s.", pattern)
  })
end

