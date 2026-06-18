vim.keymap.set("n", "<F8>", function()
    vim.cmd("TagbarToggle")
end)

vim.g.tagbar_position = "topleft vertical"
vim.g.tagbar_show_linenumbers = 2
