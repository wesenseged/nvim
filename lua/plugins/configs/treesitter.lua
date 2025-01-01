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

  -- Enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },

  -- Enable auto pair (w/ nvim-autopairs plugin)
  autopairs = { enable = true },
})
