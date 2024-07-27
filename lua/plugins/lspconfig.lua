local plugin = {"neovim/nvim-lspconfig"}
plugin.config = function()
  vim.diagnostic.config({
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })
end
return plugin

