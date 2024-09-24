# Configuration files for Neovim

## Installation

1. Run the following in the `~/.config` directory:
```bash
git clone git@github.com:pavel-obraztcov/neovim-config.git nvim
```
2. Install packer:
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
3. Run `:PackerSync` in Neovim. Open `lua/pavel/packer.lua` and
run
```
:source
:PackerSync
```

## Structure
- `init.vim` - main configuration file (needs to source user configuration files)
- `lua` - directory for Lua configuration files
- `lua/pavel` - directory for Lua configuration files by the user (pavel in this case)
- `after` - directory for configuration files that are loaded after the main configuration file
