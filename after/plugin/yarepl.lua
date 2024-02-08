require('yarepl').setup {}


-- Start a REPL and choose which one
vim.keymap.set("n", "<leader>rs", function()
    local win_id = vim.fn.win_getid()
    vim.cmd("REPLStart")
    vim.cmd("1REPLAttachBufferToREPL")
    vim.fn.win_gotoid(win_id)
end)

-- Start an IPython REPL
vim.keymap.set("n", "<leader>rp", function()
    local win_id = vim.fn.win_getid()
    vim.cmd("REPLStart ipython")
    vim.cmd("1REPLAttachBufferToREPL")
    vim.fn.win_gotoid(win_id)
end)

local function sleep(n)
  os.execute("sleep " .. tonumber(n))
end

-- Close REPL
vim.keymap.set("n", "<leader>rq", function()
    vim.cmd("REPLClose")
    sleep(2)
    vim.cmd("REPLExec y")
end)

-- Key bindings to send stuff to REPL
-- Line
vim.keymap.set("n", "<leader>l", "<cmd>REPLSendLine<CR>")
-- Line + go down
vim.keymap.set("n", "<leader>d", "<cmd>REPLSendLine<CR>j")
-- Any movement
vim.keymap.set("n", "<leader>o", "<cmd>REPLSendOperator<CR>")
-- Paragraph
vim.keymap.set("n", "<leader>pp", "<cmd>REPLSendOperator<CR>ap")
-- Visual selection
vim.keymap.set("v", "<leader>ss", "<cmd>REPLSendVisual<CR>")
