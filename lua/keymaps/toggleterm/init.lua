local Terminal = require("toggleterm.terminal").Terminal
local terminals = {
  lazygit = {},
  tmux = {},
  copilot = {},
}

function _on_open(term)
  local keymap_opts = { noremap = true, silent = true, buffer = term.bufnr }
  vim.keymap.set("t", "<c-]>", "<c-\\><c-n>", keymap_opts)
  vim.keymap.set("n", "q", "<cmd>close<CR>", keymap_opts)
end

function _lazygit_toggle()
  local cwd = vim.fn.getcwd()
  local lazygit = terminals.lazygit[cwd]
  if lazygit == nil then
    lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      on_open = _on_open,
    })
    terminals.lazygit[cwd] = lazygit
  end
  lazygit:toggle()
end

function _tmux_toggle()
  local cwd = vim.fn.getcwd()
  local tmux = terminals.tmux[cwd]
  if tmux == nil then
    tmux = Terminal:new({
      cmd = "tmux new-session -A -s nvim",
      hidden = true,
      on_open = _on_open,
    })
    terminals.tmux[cwd] = tmux
  end
  tmux:toggle()
end

function _copilot_toggle()
  local cwd = vim.fn.getcwd()
  local copilot = terminals.copilot[cwd]
  if copilot == nil then
    copilot = Terminal:new({
      cmd = "copilot",
      hidden = true,
      on_open = _on_open,
    })
    terminals.copilot[cwd] = copilot
  end
  copilot:toggle()
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
  "<cmd>lua _tmux_toggle()<CR>",
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader>lk",
  "<cmd>lua _copilot_toggle()<CR>",
  { noremap = true, silent = true }
)

