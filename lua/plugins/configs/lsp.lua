local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Diagnostic config (same as before)
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

-- Diagnostic keymaps (same as before)
vim.keymap.set('n', ';d', vim.diagnostic.open_float, { desc = "Open Diagnostic" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = "Set LocList" })

-- LSP improvements
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- LSP attach autocmd + keymaps (same as before)
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local buf = ev.buf
    local opts = { buffer = buf }
    -- Telescope keymaps here as you had
    -- ...
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

local on_attach = function(client, bufnr)
  prevent_duplicate_clients(client, bufnr)
end

-- Configuration table shortcut
local cfg = function(server_name, options)
  -- Merge with common capabilities and on_attach
  local config = vim.tbl_deep_extend("force", {
    capabilities = capabilities,
    on_attach = on_attach,
  }, options or {})
  -- Define config for server
  vim.lsp.config(server_name, config)
  -- Enable the server
  vim.lsp.enable(server_name)
end

-- Setup language servers with the new API style
cfg("html")
cfg("cssls", {
  filetypes = { "css" },
})

cfg("tailwindcss")

cfg("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

cfg("biome", {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
})

cfg("vtsls", {
  on_attach = function(client, bufnr)
    prevent_duplicate_clients(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end,
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
})

cfg("cmake")

cfg("clangd", {
  cmd = { "clangd", "--compile-commands-dir=build" },
})

cfg("qmlls", {
  cmd = { "qmlls" },
  filetypes = { "qml", "qmljs" },
  settings = {
    qmlls = {
      trace = { server = "verbose" },
    },
  },
})

cfg("zls", {
  -- Use the system-installed ZLS.
  -- If you do NOT have ZLS installed on your system,
  -- delete the next line and install ZLS through Mason.
  cmd = { "zls" },
  filetypes = { "zig" },
  settings = {
    zls = {
      semantic_tokens = "partial",
    },
  },
})
