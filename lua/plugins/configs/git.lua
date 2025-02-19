require("gitsigns").setup({
  signs = {
    add          = { text = "│" },
    change       = { text = "│" },
    delete       = { text = "_" },
    topdelete    = { text = "‾" },
    changedelete = { text = "~" },
  },
  numhl = true,              -- Highlight numbers in the gutter
  linehl = false,            -- Highlight entire changed lines
  word_diff = false,         -- Highlight word differences
  current_line_blame = true, -- Show Git blame inline
  current_line_blame_opts = {
    virt_text = true,
    delay = 500,
    virt_text_pos = "eol",
  },
})
