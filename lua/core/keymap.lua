-- ~/.config/nvim/lua/core/keymaps.lua
local keymap = vim.keymap

-- Lazy
keymap.set("n", "<leader>l", ":Lazy<CR>", { desc = "Lazy" })
-- Mason
keymap.set("n", "<leader>m", ":Lazy<CR>", { desc = "Mason" })

-- Remap window navigation to <C-h>, <C-j>, <C-k>, and <C-l>
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })


-- General keymaps
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "x", '"_x', { desc = "Delete single character without copying into register" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab" })

-- Nvim tree toggle
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- Tab navigation when not in insert mode
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true, desc = "Go to next buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true, desc = "Go to previous buffer" })
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { silent = true, desc = "Toggle Pin" })
vim.keymap.set("n", ";z", "<Cmd>BufferLineCloseOthers<CR>", { silent = true, desc = "Delete Non-Pinned Buffers" })
vim.keymap.set("n", ";x", "<Cmd>BufferLineCloseLeft<CR>", { silent = true, desc = "Delete Buffers to the Left" })
vim.keymap.set("n", ";c", "<Cmd>BufferLineCloseRight<CR>", { silent = true, desc = "Delete Buffers to the Right" })
vim.keymap.set("n", "[b", "<cmd>BufferLineMovePrev<cr>", { silent = true, desc = "Move buffer prev" })
vim.keymap.set("n", "]b", "<cmd>BufferLineMoveNext<cr>", { silent = true, desc = "Move buffer next" })


-- Additional plugin keymaps will be added in their respective config files
