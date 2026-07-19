vim.pack.add({
  "https://github.com/wesenseged/stone.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-file-browser.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/akinsho/bufferline.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/kylechui/nvim-surround",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-mini/mini.comment",
  "https://github.com/lewis6991/gitsigns.nvim",
})

    local cmp = require('blink.cmp')
    cmp.build():pwait()
    cmp.setup({
      keymap = { preset = "default" },
      snippets = {
        preset = "luasnip",
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = {
          auto_show = true,
        },
      },
    })

vim.cmd.colorscheme('stone-base')

require("lualine").setup({
  options = {
    section_separators = "",
    component_separators = "",
  },
  sections = {
    lualine_c = { "none" },
    lualine_x = { "none" },
  },
})
require("bufferline").setup()
require("mini.comment").setup()
require("nvim-autopairs").setup()
require("nvim-ts-autotag").setup()
require("nvim-surround").setup()
require("plugins.stone")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.conform")
require("plugins.lsp")
require("plugins.git")
