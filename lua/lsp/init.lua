local lspservers = {
  html = {},
  htmx = {},
  gopls = {},
  rust_analyzer = {},
  ts_ls = {},
  pyright = {},
  clangd = {
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "cc" },
  },
}
for lspserver, config in pairs(lspservers) do
  vim.lsp.config[lspserver] = config
  vim.lsp.enable(lspserver)
end
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local opts = { buffer = args.buf, noremap = true, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  end,
})

