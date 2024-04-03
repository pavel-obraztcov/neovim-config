# Configuration files for Neovim

## Installation
Run the following in the `~/.config/nvim` directory:
```bash
git clone git@github.com:pavel-obraztcov/neovim-config.git nvim
```

## Structure
- `init.vim` - main configuration file (needs to source user configuration files)
- `lua` - directory for Lua configuration files
- `lua/pavel` - directory for Lua configuration files by the user (pavel in this case)
- `after` - directory for configuration files that are loaded after the main configuration file
