-- ~/.config/nvim/lua/plugins/configs/stone.lua

local function apply_stone(variant)
  require("stone").setup({
    variant = variant or "base",
    transparent_background = false,
    show_end_of_buffer = false,
    integrations = {
      nvimtree = true,
      mason = true,
      telescope = true,
      lazy = true,
      which_key = true,
    },
  })
end

-- Defer colorscheme setup until VimEnter
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    apply_stone("base")
  end,
})

-- Reapply when colorscheme changes (e.g. by plugins)
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local variant = vim.g.colors_name:match("^stone%-(%w+)$") or "base"
    apply_stone(variant)
  end,
})
