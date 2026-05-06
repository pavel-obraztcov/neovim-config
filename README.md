# Configuration files for Neovim

## Installation

1. Run the following in the `~/.config` directory:
```bash
git clone git@github.com:pavel-obraztcov/neovim-config.git nvim
```
2. Start Neovim. `vim.pack` will install missing plugins automatically from
	`lua/pavel/plugins.lua`.
3. After the first startup, run:
```vim
:TSUpdate
:MasonUpdate
```

## Structure
- `init.vim` - main configuration file (needs to source user configuration files)
- `lua` - directory for Lua configuration files
- `lua/pavel` - directory for Lua configuration files by the user (pavel in this case)
- `after` - directory for configuration files that are loaded after the main configuration file
