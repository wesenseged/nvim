require('mini.starter').setup {
  autoopen = true,
  evaluate_single = false,
  items = {
    { action = 'Telescope find_files',   name = 'Find files',   section = 'Files' },
    { action = 'Telescope oldfiles',     name = 'Recent files', section = 'Files' },
    { action = 'Telescope git_status',   name = 'Git status',   section = 'Git' },
    { action = 'Telescope git_branches', name = 'Git branches', section = 'Git' },
    { action = 'Telescope colorscheme',  name = 'Themes',       section = 'System' },
    { action = 'Telescope keymaps',      name = 'keymaps',      section = 'System' },
    { action = ':q',                     name = 'Quit Neovim',  section = 'System' },
  },

  header = '# Welcome to Neovim!',
  footer = '',
  content_hooks = nil,
  query_updaters = 'abcdefghijklmnopqrstuvwxyz0123456789_-.',
  silent = false,
}
