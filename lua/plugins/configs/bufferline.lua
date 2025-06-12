-- ~/.config/nvim/lua/plugins/configs/bufferline.lua
require('bufferline').setup {
  options = {
    mode = "buffers", -- set to "tabs" to use tabpages instead
    numbers = "none", -- can be "none", "ordinal", "buffer_id", "both"
    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'icon', -- can also be 'underline' | 'none',
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "left" } },
    show_buffer_icons = true, -- disable for more consistent tab sizes
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = "thin",   -- can also be 'thick' | 'thin' | {'any', 'any'}
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = 'id'
  }
}
