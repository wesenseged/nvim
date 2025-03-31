-- ~/.config/nvim/lua/plugins/configs/treesitter.lua
require("nvim-ts-autotag").setup({
  ensure_installed = {
    "lua",
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "json",
    "yaml",
    "markdown",
    "markdown_inline",
    "bash",
    "vim",
  },
  highlight = {
    enable = true,
  },

  -- Enable indentation
  indent = { enable = true },
})
