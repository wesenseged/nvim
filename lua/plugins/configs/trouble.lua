require('trouble').setup {
  modes = { lsp = { win = { position = "right" }, }, },
}
-- Key mappings
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.api.nvim_set_keymap("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  { desc = "Buffer Diagnostics (Trouble)" })
vim.api.nvim_set_keymap("n", "<leader>cs", "<cmd>Trouble symbols toggle<cr>", { desc = "Symbols (Trouble)" })
vim.api.nvim_set_keymap("n", "<leader>cS", "<cmd>Trouble lsp toggle<cr>",
  { desc = "LSP references/definitions/... (Trouble)" })
vim.api.nvim_set_keymap("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
vim.api.nvim_set_keymap("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- Quickfix navigation
vim.api.nvim_set_keymap("n", "[q",
  [[<cmd>lua if require("trouble").is_open() then require("trouble").prev({ skip_groups = true, jump = true }) else pcall(vim.cmd.cprev) end<cr>]],
  { desc = "Previous Trouble/Quickfix Item" })
vim.api.nvim_set_keymap("n", "]q",
  [[<cmd>lua if require("trouble").is_open() then require("trouble").next({ skip_groups = true, jump = true }) else pcall(vim.cmd.cnext) end<cr>]],
  { desc = "Next Trouble/Quickfix Item" })
