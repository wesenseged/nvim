-- ~/.config/nvim/lua/plugins/configs/cmp.lua
local cmp = require("cmp")
local luasnip = require("luasnip")

-- Load friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip").filetype_extend("javascriptreact", { "html", "typescript" })
require("luasnip").filetype_extend("typescriptreact", { "html", "typescript" })

-- Tailwind CSS setup for colorizer
require("tailwindcss-colorizer-cmp").setup({
  color_square_width = 2,
})

local check_backspace = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    format = require("tailwindcss-colorizer-cmp").formatter,
  },
  preselect = cmp.PreselectMode.Item, -- Automatically select first item
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  mapping = {
    -- Navigation in completion menu
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion

    -- Tab navigation
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  },
  sources = cmp.config.sources({
    { name = "copilot" },  -- Copilot
    { name = "nvim_lsp" }, -- LSP
    { name = "luasnip" },  -- snippets
    { name = "buffer" },   -- text within current buffer
    { name = "path" },     -- file system paths
  }),
})
