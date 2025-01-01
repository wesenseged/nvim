-- ~/.config/nvim/lua/plugins/configs/telescope.lua
local telescope = require("telescope")
local actions = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        -- ["<CR>"] = require "telescope.actions".select_tab
      },
      n = {
        -- ["<CR>"] = require "telescope.actions".select_tab
      }
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd("startinsert")
          end,
          ["<C-u>"] = function(prompt_bufnr)
            for i = 1, 10 do
              actions.move_selection_previous(prompt_bufnr)
            end
          end,
          ["<C-d>"] = function(prompt_bufnr)
            for i = 1, 10 do
              actions.move_selection_next(prompt_bufnr)
            end
          end,
          ["<PageUp>"] = actions.preview_scrolling_up,
          ["<PageDown>"] = actions.preview_scrolling_down,
        },
      },
    },
  },
})

-- Load extensions
telescope.load_extension("file_browser")

-- Telescope keymaps
local keymap = vim.keymap

keymap.set("n", ";f", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", ";r", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", ";l", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", ";t", "<cmd>Telescope colorscheme<cr>", { desc = "Colorscheme browser" })
keymap.set("n", ";w", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", ";s", function()
  local function telescope_buffer_dir()
    return vim.fn.expand("%:p:h")
  end

  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 },
  })
end, { desc = "Open File Browser with current buffer path" })
