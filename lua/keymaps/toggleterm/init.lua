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
  local wd = vim.fs.root(0, ".git")
  local lazygit = terminals.lazygit[wd]
  if lazygit == nil then
    lazygit = Terminal:new({
      cmd = "lazygit",
      dir = wd,
      hidden = true,
      on_open = _on_open,
    })
    terminals.lazygit[wd] = lazygit
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
