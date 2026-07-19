require("stone").setup({
  variant = "base", -- "base" | "dark" | "light"
  transparent_background = false,
  styles = {
    comments = { "italic" },
    functions = { "bold" },
  },
  integrations = {
    telescope = true,
  },
})
