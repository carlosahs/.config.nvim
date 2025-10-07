local Terminal = require("toggleterm.terminal").Terminal
local terminals = {
  lazygit = {},
  tmux = {},
}

function _on_open(term)
  vim.cmd("startinsert!")
  local keymap_opts = { noremap = true, silent = true, buffer = term.bufnr }
  vim.keymap.set("t", "<c-]>", "<c-\\><c-n>", keymap_opts)
  vim.keymap.set("n", "q", "<cmd>close<CR>", keymap_opts)
end

function _on_close(term)
  vim.cmd("startinsert!")
end

function _lazygit_toggle()
  local cwd = vim.fn.getcwd()
  local lazygit = terminals.lazygit[cwd]
  if lazygit == nil then
    lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      on_open = _on_open,
      on_close = _on_close,
    })
    terminals.lazygit[cwd] = lazygit
  end
  lazygit:toggle()
end

function _tmux_cwd_toggle()
  local cwd = vim.fn.getcwd()
  local tmux = terminals.tmux[cwd]
  if tmux == nil then
    tmux = Terminal:new({
      cmd = string.format("tmux new-session -A -s %s", cwd),
      hidden = true,
      on_open = _on_open,
      on_close = _on_close,
    })
    terminals.tmux[cwd] = tmux
  end
  tmux:toggle()
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

