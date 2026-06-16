local ts = require("nvim-treesitter")
local ensure_installed = {"c", "lua", "vim", "query", "javascript",
  "python", "r", "markdown", "julia" }
local already_installed = ts.get_installed()
local to_install = vim.
	iter(ensure_installed)
	:filter(function(parser) return not vim.tbl_contains(already_installed, parser) end)
	:totable()
if #to_install > 0 then
  ts.install(to_install)
end
