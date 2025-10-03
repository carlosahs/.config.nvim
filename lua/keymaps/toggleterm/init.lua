local Terminal = require("toggleterm.terminal").Terminal

function _on_open(term)
  vim.cmd("startinsert!")
  local keymap_opts = { noremap = true, silent = true, buffer = term.bufnr }
  vim.keymap.set("t", "<c-]>", "<c-\\><c-n>", keymap_opts)
  vim.keymap.set("n", "q", "<cmd>close<CR>", keymap_opts)
end

function _on_close(term)
  vim.cmd("startinsert!")
end

local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  on_open = _on_open,
  on_close = _on_close,
})
local tmux_cwd = Terminal:new({
  cmd = string.format("tmux new-session -A -s %s", vim.fn.getcwd()),
  hidden = true,
  on_open = _on_open,
  on_close = _on_close,
})

function _lazygit_toggle()
  lazygit:toggle()
end

function _tmux_cwd_toggle()
  tmux_cwd:toggle()
end

vim.keymap.set(
  "n",
  "<leader>lh",
  "<cmd>lua _lazygit_toggle()<CR>",
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader>lj",
  "<cmd>lua _tmux_cwd_toggle()<CR>",
  { noremap = true, silent = true }
)

