local telescope = require("telescope")
local actions = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions
local previewers = require("telescope.previewers")
local Job = require("plenary.job")

telescope.setup({
  defaults = {
    buffer_previewer_maker = function(filepath, bufnr, opts)
      filepath = vim.fn.expand(filepath)
      Job:new({
        command = "file",
        args = { "--mime-type", "-b", filepath },
        on_exit = function(j)
          local mime_type = j:result()[1]
          if mime_type and not vim.startswith(mime_type, "text") then
            return
          else
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
          end
        end,
      }):sync()
    end,
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
      n = {}
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      mappings = {
        ["n"] = {
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd("startinsert")
          end,
          ["<C-u>"] = function(prompt_bufnr)
            for i = 1, 10 do
              _ = i
              actions.move_selection_previous(prompt_bufnr)
            end
          end,
          ["<C-d>"] = function(prompt_bufnr)
            for i = 1, 10 do
              _ = i
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
