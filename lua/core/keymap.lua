local keymap = vim.keymap

-- Lazy
keymap.set("n", "<leader>l", ":Lazy<CR>", { desc = "Lazy" })

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

-- Tab navigation and control
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true, desc = "Go to next buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true, desc = "Go to previous buffer" })
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { silent = true, desc = "Toggle Pin" })
vim.keymap.set("n", ";x", "<Cmd>BufferLineCloseOthers<CR>", { silent = true, desc = "Delete Non-Pinned Buffers" })
vim.keymap.set("n", ";z", "<Cmd>BufferLineCloseLeft<CR>", { silent = true, desc = "Delete Buffers to the Left" })
vim.keymap.set("n", ";c", "<Cmd>BufferLineCloseRight<CR>", { silent = true, desc = "Delete Buffers to the Right" })
vim.keymap.set("n", "[b", "<cmd>BufferLineMovePrev<cr>", { silent = true, desc = "Move buffer prev" })
vim.keymap.set("n", "]b", "<cmd>BufferLineMoveNext<cr>", { silent = true, desc = "Move buffer next" })

-- Git
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Git Preview" })
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Git Blame" })
-- vim.keymap.set("n", "<leader>gs", require("gitsigns").stage_hunk, { desc = "Stage Git hunk" })
-- vim.keymap.set("n", "<leader>gr", require("gitsigns").reset_hunk, { desc = "Reset Git hunk" })

-- Telescope
keymap.set("n", ";f", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", ";r", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", ";l", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", ";g", "<cmd>Telescope git_status<cr>", { desc = "List git status for current directory" })
keymap.set("n", ";t", "<cmd>Telescope colorscheme<cr>", { desc = "Colorscheme browser" })
keymap.set("n", ";w", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", ";k", "<cmd>Telescope keymaps<cr>", { desc = "List all keymaps" })
keymap.set("n", ";a", "<cmd>Telescope buffers<cr>", { desc = "List of active buffers" })
keymap.set("n", ";s", function()
  local function telescope_buffer_dir()
    return vim.fn.expand("%:p:h")
  end

  require("telescope").extensions.file_browser.file_browser({
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

-- Additional plugin keymaps will be added in their respective config files
