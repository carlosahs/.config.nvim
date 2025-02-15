local lspconfig = require("lspconfig")
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local opts = {buffer = bufnr, noremap = true, silent = true}
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
end

local lspservers = { 
  html = { on_attach = on_attach },
  gopls = { on_attach = on_attach },
  htmx = { on_attach = on_attach },
  rust_analyzer = { on_attach = on_attach },
  tsserver = {
    on_attach = on_attach,
    init_options = {
      -- Do not insert extra period when completing
      completionDisableFilterText = true,
    },
  },
  pyright = { on_attach = on_attach },
  clangd = {
    on_attach = on_attach,
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "cc" },
  },
}
for lspserver, lspserver_config in pairs(lspservers) do
  lspconfig[lspserver].setup(lspserver_config)
end

