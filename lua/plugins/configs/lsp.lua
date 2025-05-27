-- ~/.config/nvim/lua/plugins/configs/lsp.lua
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Global diagnostic configuration
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 2,
    source = "if_many",
  },
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

-- Global mappings

local keymap = vim.keymap
local lsp = vim.lsp

keymap.set('n', ';d', vim.diagnostic.open_float, { desc = "open diagnostic" })
keymap.set('n', '[d', vim.diagnostic.goto_prev)
keymap.set('n', ']d', vim.diagnostic.goto_next)
keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    keymap.set('n', 'gD', lsp.buf.declaration, opts)
    keymap.set('n', 'gd', lsp.buf.definition, opts)
    keymap.set('n', 'K', lsp.buf.hover, opts)
    keymap.set('n', 'gi', lsp.buf.implementation, opts)
    keymap.set('n', '<C-k>', lsp.buf.signature_help, opts)
    keymap.set('n', '<space>wa', lsp.buf.add_workspace_folder, opts)
    keymap.set('n', '<space>wr', lsp.buf.remove_workspace_folder, opts)
    keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    keymap.set('n', '<space>D', lsp.buf.type_definition, opts)
    keymap.set('n', '<space>rn', lsp.buf.rename, opts)
    keymap.set({ 'n', 'v' }, '<space>ca', lsp.buf.code_action, opts)
    keymap.set('n', 'gr', lsp.buf.references, opts)
    keymap.set("n", "<leader>rn", function()
      return ":IncRename " .. vim.fn.expand("<cword>")
    end, { expr = true, desc = "Rename (inc-rename.nvim)" })
    keymap.set('n', '<space>f', function()
      lsp.buf.format { async = true }
    end, opts)
  end,
})

-- Setup language servers

-- Html Lsp Setup
lspconfig.html.setup({
  capabilities = capabilities,
})

-- Css Lsp Setup
lspconfig.cssls.setup({
  capabilities = capabilities,
  filetypes = { "css" },
})

-- Tailwind CSS LSP setup
lspconfig.tailwindcss.setup({
  capabilities = capabilities,
})

-- Lua Lsp Setup
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- Vtsls Lsp Setup
lspconfig.vtsls.setup({
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false -- disable vtsls formatting
  end,
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
})
