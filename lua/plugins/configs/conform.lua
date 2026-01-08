require("conform").setup({
  formatters_by_ft = {
    html = { "biome" },
    css = { "biome" },
    javascript = { "biome" },
    javascriptreact = { "biome" },
    typescript = { "biome" },
    typescriptreact = { "biome" },
    json = { "biome" },
    lua = { "stylua" },
  },
  formatters = {
    biome = {
      command = "biome",
      args = { "format", "--stdin-file-path", "$FILENAME" },
      stdin = true,
    },
  },
  format_on_save = {
    lsp_format = "fallback",
  },
})
