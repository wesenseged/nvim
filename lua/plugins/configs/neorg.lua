require("neorg").setup({
  load = {
    ["core.defaults"] = {},  -- Loads default behaviour
    ["core.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.ui.calendar"] = {},
    ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
    ["core.integrations.nvim-cmp"] = {},
    -- ["core.concealer"] = { config = { icon_preset = "diamond" } },
    ["core.esupports.metagen"] = { config = { type = "auto", update_date = true } },
    ["core.qol.toc"] = {},
    ["core.qol.todo_items"] = {},
    ["core.looking-glass"] = {},
    ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
    ["core.export"] = {},
    ["core.export.markdown"] = { config = { extensions = "all" } },
    ["core.summary"] = {},
    ["core.tangle"] = { config = { report_on_empty = false } },
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = "~/Notes/note",
          work = "~/Notes/work",
        },
        default_workspace = "work",
      },
    },
  },
})
