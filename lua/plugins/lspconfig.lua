local plugin = {"neovim/nvim-lspconfig"}
plugin.config = function()
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = "rounded" }
  )
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = "rounded" }
  )
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

