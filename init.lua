require("config.lazy")
require("keymaps")
require("lsp")
require("options")

vim.cmd("colorscheme tokyonight-night")

vim.g.have_nerd_font = false

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
    tabstop = 2,
    shiftwidth = 2,
    softtabstop = 0,
    expandtab = true,
  },
  ["*.js"] = {
    tabstop = 2,
    shiftwidth = 2,
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
    tabstop = 2,
    shiftwidth = 2,
    softtabstop = 2,
    expandtab = true,
  },
  ["*.json"] = {
    tabstop = 2,
    shiftwidth = 2,
    softtabstop = 2,
    expandtab = true,
  },
  ["*.cpp"] = {
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
  },
  ["*.cc"] = {
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
  },
  ["*.c"] = {
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
  },
  ["*.svg"] = {
    tabstop = 2,
    shiftwidth = 2,
    softtabstop = 2,
    expandtab = true,
  },
  ["site.webmanifest"] = {
    tabstop = 2,
    shiftwidth = 2,
    softtabstop = 2,
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

