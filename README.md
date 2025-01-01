# My Neovim Setup

This repository contains my personalized Neovim configuration, designed to be minimal yet feature-rich, optimized for TypeScript, HTML, CSS, Lua, Bash, and C development. It uses `lazy.nvim` for plugin management and includes a carefully curated set of plugins for productivity, aesthetics, and functionality.

## 📂 Folder Structure

```plaintext
nvim
├── README.md       # This file
├── init.lua        # Main Neovim configuration file
├── lua
│   ├── core
│   │   ├── core.lua        # Core configurations
│   │   ├── keymap.lua      # Custom key mappings
│   │   ├── options.lua     # Editor options/settings
│   ├── plugins
│       ├── init.lua        # Plugin specification
│       ├── config          # Folder containing plugin configurations
│           ├── config1.lua # File containing plugin configurations
```

## 🌟 Key Features

- 🔧 **Plugin Management**: Uses `lazy.nvim` for fast and efficient plugin loading.
- 🚀 **Language Server Protocol (LSP)**: Seamless LSP integration for enhanced coding experience.
- ✨ **Auto-completion**: Powered by `nvim-cmp` and `LuaSnip`.
- 🎨 **Syntax Highlighting**: `nvim-treesitter` for advanced syntax highlighting and code parsing.
- 🌍 **Version Control**: Integrated `gitsigns.nvim` and `vim-fugitive` for Git support.
- 🔍 **File Navigation**: `telescope.nvim` and `nvim-tree.lua` for fast and efficient file browsing.
- 🎨 **Visual Customization**: Beautiful colorscheme with `catppuccin.nvim`.

## 📦 Plugin List

Here is the list of plugins included in this setup:

| Plugin                     | Description                           |
|----------------------------|---------------------------------------|
| `Comment.nvim`             | Toggle comments easily               |
| `LuaSnip`                  | Snippet engine                       |
| `bufferline.nvim`          | Buffer line for better tab management|
| `cmp-buffer`, `cmp-path`   | Completion sources for `nvim-cmp`    |
| `nvim-cmp`                 | Autocompletion plugin                |
| `nvim-lspconfig`           | Simplified LSP configuration         |
| `nvim-tree.lua`            | File explorer                        |
| `nvim-treesitter`          | Syntax highlighting and more         |
| `plenary.nvim`             | Utility functions for plugins        |
| `telescope.nvim`           | Fuzzy finder and picker              |
| `catppuccin.nvim`          | Colorscheme                          |
| `gitsigns.nvim`            | Git integration                      |
| `vim-fugitive`             | Git wrapper                          |
| `which-key.nvim`           | Displays key bindings on the fly     |

## 🛠️ Installation

### Prerequisites
- Neovim (>= 0.9)
- Git
- Nerd Font (optional)

### Steps

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/nvim ~/.config/nvim
   ```

2. Remove the .git folder, so you can add it to your own repo later
   ```bash
   rm -rf ~/.config/nvim/.git
   ```

3. Open Neovim and install plugins:
   ```bash
   nvim
   ```
   `lazy.nvim` will automatically install all listed plugins on first launch.

3. Restart Neovim to apply the changes.

## ⌨️ Custom Key Mappings

Key mappings are defined in `lua/core/keymap.lua`. Here are the key mappings in a tabular format for easy reference:

| Keybinding                | Description                                            |
|---------------------------|--------------------------------------------------------|
| `<leader>l`               | Open Lazy.nvim                                         |
| `<leader>m`               | Open Mason.nvim                                        |
| `<C-h>`                   | Navigate to the left window                            |
| `<C-j>`                   | Navigate to the bottom window                          |
| `<C-k>`                   | Navigate to the top window                             |
| `<C-l>`                   | Navigate to the right window                           |
| `<leader>nh`              | Clear search highlights                                |
| `x`                       | Delete single character without copying to register    |
| `<leader>sv`              | Split window vertically                                |
| `<leader>sh`              | Split window horizontally                              |
| `<leader>se`              | Make splits equal size                                 |
| `<leader>sx`              | Close current split                                    |
| `<leader>to`              | Open new tab                                           |
| `<leader>tx`              | Close current tab                                      |
| `<leader>tn`              | Go to next tab                                         |
| `<leader>tp`              | Go to previous tab                                     |
| `<leader>e`               | Toggle NvimTree file explorer                         |
| `<Tab>`                   | Go to next buffer                                      |
| `<S-Tab>`                 | Go to previous buffer                                  |
| `<leader>bp`              | Toggle buffer pin                                      |
| `;z`                      | Delete non-pinned buffers                              |
| `;x`                      | Delete buffers to the left                             |
| `;c`                      | Delete buffers to the right                           |
| `[b`                      | Move buffer to the previous position                  |
| `]b`                      | Move buffer to the next position                      |
| `<leader>gp`              | Preview Git hunk                                      |
| `<leader>gt`              | Toggle Git blame                                      |
| `<space>e`                | Open diagnostics float                                 |
| `[d`                      | Go to previous diagnostic                              |
| `]d`                      | Go to next diagnostic                                  |
| `<space>q`                | Set diagnostics to loclist                             |
| `gD`                      | Go to declaration                                      |
| `gd`                      | Go to definition                                       |
| `K`                       | Show hover documentation                              |
| `gi`                      | Go to implementation                                  |
| `<C-k>`                   | Show signature help                                   |
| `<space>wa`               | Add workspace folder                                  |
| `<space>wr`               | Remove workspace folder                               |
| `<space>wl`               | List workspace folders                                |
| `<space>D`                | Go to type definition                                 |
| `<space>rn`               | Rename symbol                                         |
| `<space>ca`               | Code actions                                          |
| `gr`                      | Show references                                       |
| `<leader>rn`              | Incremental rename with `inc-rename.nvim`            |
| `<space>f`                | Format code                                           |
| `;f`                      | Fuzzy find files in cwd                               |
| `;r`                      | Fuzzy find recent files                               |
| `;l`                      | Live grep in cwd                                      |
| `;t`                      | Browse colorschemes                                   |
| `;w`                      | Find string under cursor in cwd                      |
| `;s`                      | Open file browser at current buffer path             |
| `<leader>xx`              | Toggle diagnostics in Trouble                         |
| `<leader>xX`              | Toggle buffer diagnostics in Trouble                  |
| `<leader>cs`              | Toggle symbols in Trouble                             |
| `<leader>cS`              | Toggle LSP references/definitions in Trouble          |
| `<leader>xL`              | Toggle location list in Trouble                       |
| `<leader>xQ`              | Toggle quickfix list in Trouble                       |
| `[q`                      | Previous Trouble/Quickfix item                        |
| `]q`                      | Next Trouble/Quickfix item                            |

## 🤝 Contributing

Feel free to fork this repository and submit a pull request with your improvements or customizations!

## 📜 License

This configuration is open-sourced under the MIT License. See [LICENSE](LICENSE) for details.
