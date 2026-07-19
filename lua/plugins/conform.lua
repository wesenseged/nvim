require("conform").setup({
  formatters_by_ft = {
    html = { "biome-check" },
    css = { "biome-check" },
    javascript = { "biome-check" },
    javascriptreact = { "biome-check" },
    typescript = { "biome-check" },
    typescriptreact = { "biome-check" },
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

