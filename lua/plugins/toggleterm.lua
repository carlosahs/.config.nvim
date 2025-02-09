local plugin = {"akinsho/toggleterm.nvim"}
plugin.version = "*"
plugin.config = {
  open_mapping = [[<c-\>]],
  direction = "float",
  close_on_exit = true,
  on_create = function(t)
    t:send(string.format("tmux new-session -A -s %s", vim.fn.getcwd()))
  end,
}

return plugin

