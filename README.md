# My Neovim Setup

```plaintext
nvim
├── README.md       # This file
├── init.lua        # Main Neovim configuration file
├── lua
│   ├── core
│   │   ├── pack.lua        # Plugin specification
│   │   ├── keymap.lua      # Custom key mappings
│   │   ├── options.lua     # Editor options/settings
│   ├── plugins
│       ├── plugin1.lua        # Plugin specification
```
## Installation

#### Arch Linux
 ```bash
sudo pacman -S clang lua-language-server qt6-declarative npm
```

#### Install Language Servers
```bash
npm install -g \
@vtsls/language-server \
typescript \
typescript-language-server \
@tailwindcss/language-server \
vscode-langservers-extracted \
@biomejs/biome
```

#### Install ZLS
```bash
git clone https://github.com/zigtools/zls.git
cd zls
zig build -Doptimize=ReleaseSafe
```
Add `zls/zig-out/bin` to your `PATH`.

### Steps

1. Clone this repository:
   ```bash
   git clone https://github.com/wesenseged/nvim ~/.config/nvim
   ```

2. Remove the .git folder, so you can add it to your own repo later
   ```bash
   rm -rf ~/.config/nvim/.git
   ```

3. Open Neovim and install plugins:
   ```bash
   nvim
   ```

4.   Press `y` when prompted. `vim.pack` will automatically install all configured plugins on first launch.

5.   Restart Neovim after the installation completes.
