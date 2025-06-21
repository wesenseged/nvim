-- ~/.config/nvim/lua/plugins/configs/lsp.lua

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Diagnostic config
vim.diagnostic.config({
  virtual_text = { prefix = "●", spacing = 2, source = "if_many" },
  signs = {
    active = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Diagnostic keymaps
vim.keymap.set('n', ';d', vim.diagnostic.open_float, { desc = "Open Diagnostic" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = "Set LocList" })

-- LSP keymaps using Telescope
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local buf = ev.buf
    local opts = { buffer = buf }

    -- Telescope-based navigation
    vim.keymap.set("n", "gD", "<cmd>Telescope lsp_document_symbols<CR>",
      { desc = "Document Symbols", buffer = buf })
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Go to Definition", buffer = buf })
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "Show References", buffer = buf })
    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Go to Implementation", buffer = buf })
    vim.keymap.set("n", "<space>D", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Type Definition", buffer = buf })
    vim.keymap.set("n", "<space>ws", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
      { desc = "Workspace Symbols", buffer = buf })

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    vim.keymap.set("n", "<leader>rn", function()
      return ":IncRename " .. vim.fn.expand("<cword>")
    end, { expr = true, desc = "Rename (inc-rename)" })

    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

local function prevent_duplicate_clients(client, bufnr)
  for _, c in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
    if c.name == client.name and c.id ~= client.id then
      vim.schedule(function()
        vim.lsp.stop_client(client.id)
      end)
      return
    end
  end
end


-- Language servers setup

lspconfig.html.setup({ capabilities = capabilities })

lspconfig.cssls.setup({
  capabilities = capabilities,
  filetypes = { "css" },
})

lspconfig.tailwindcss.setup({
  capabilities = capabilities,
})

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- Fix 'undefined global vim'
      },
    },
  },
})

lspconfig.vtsls.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    prevent_duplicate_clients(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end,
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
})

lspconfig.zls.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    prevent_duplicate_clients(client, bufnr)
  end,
  filetypes = { "zig" },
  settings = {
    zls = {
      semantic_tokens = "partial",
    },
  },
})
