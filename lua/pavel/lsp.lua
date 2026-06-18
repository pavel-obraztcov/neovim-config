vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end)
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)


vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = {current_line = true},
    underline = true,
    update_in_insert = false,
})

vim.lsp.enable("pylsp")

vim.lsp.config('pylsp', {
        settings = {
            pylsp = {
                plugins = {
                    pycodestyle = {
                        maxLineLength = 120
                    }
                }
            }
        }
    }
)
