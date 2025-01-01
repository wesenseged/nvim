-- ~/.config/nvim/lua/plugins/init.lua
return {
  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("plugins.configs.colorscheme")
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  -- Essential plugins
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("plugins.configs.treesitter")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      require("plugins.configs.telescope")
    end,
  },

  -- conform
  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      require('plugins.configs.conform')
    end
  },

  -- LSP & Completion
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "lua_ls", "tailwindcss", "eslint", "html", "cssls", "svelte" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lsp")
    end,
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },

    },
    config = function()
      require("plugins.configs.cmp")
    end,
  },

  -- Bufferline
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('plugins.configs.bufferline')
    end
  },

  -- Tree file-browser
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.configs.nvimtree")
    end,
  },

  -- git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('plugins.configs.git')
    end,
  },
  {
    "tpope/vim-fugitive",
  },
  -- for default options, refer to the configuration section for custom setup. config = function() require('config.trouble') end }
  {
    "folke/trouble.nvim",
    opts = {},
    config = function()
      require('plugins.configs.trouble')
    end,
  },

  -- Additional utilities
  {
    "numToStr/Comment.nvim",
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
    config = true,
  },
  {
    'nvim-tree/nvim-web-devicons'
  },
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    opts = {},
  },
}
