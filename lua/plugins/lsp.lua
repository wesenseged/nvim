local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

luasnip.filetype_extend("javascriptreact", { "html", "typescript" })
luasnip.filetype_extend("typescriptreact", { "html", "typescript" })

vim.diagnostic.config({
  virtual_text = { prefix = "●", spacing = 2, source = "if_many" },
  signs = {
    active = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

vim.lsp.config("biome", {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
})


vim.lsp.config("vtsls", {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
})

vim.lsp.enable({
  "html",
  "cssls",
  "tailwindcss",
  "lua_ls",
  "biome",
  "vtsls",
  "clangd",
  "qmlls",
  "zls"
})
