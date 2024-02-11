local yarepl = require('yarepl')

yarepl.setup {
    -- see `:h buflisted`, whether the REPL buffer should be buflisted.
    buflisted = true,
    -- whether the REPL buffer should be a scratch buffer.
    scratch = true,
    -- the filetype of the REPL buffer created by `yarepl`
    ft = 'REPL',
    -- How yarepl open the REPL window, can be a string or a lua function.
    -- See below example for how to configure this option
    wincmd = 'belowright 15 split',
    -- The available REPL palattes that `yarepl` can create REPL based on
    metas = {
        aichat = { cmd = 'aichat', formatter = yarepl.formatter.bracketed_pasting },
        radian = { cmd = 'radian', formatter = yarepl.formatter.bracketed_pasting },
        ipython = { cmd = 'ipython', formatter = yarepl.formatter.bracketed_pasting },
        python = { cmd = 'python', formatter = yarepl.formatter.trim_empty_lines },
        R = { cmd = 'R', formatter = yarepl.formatter.trim_empty_lines },
        utop = { cmd = 'utop', formatter = yarepl.formatter.trim_empty_lines },
        bash = { cmd = 'bash', formatter = yarepl.formatter.trim_empty_lines },
        zsh = { cmd = 'zsh', formatter = yarepl.formatter.bracketed_pasting },
    },
    -- when a REPL process exits, should the window associated with those REPLs closed?
    close_on_exit = true,
    -- whether automatically scroll to the bottom of the REPL window after sending
    -- text? This feature would be helpful if you want to ensure that your view
    -- stays updated with the latest REPL output.
    scroll_to_bottom_after_sending = true,
    os = {
        -- Some hacks for Windows. macOS and Linux users can simply ignore
        -- them. The default options are recommended for Windows user.
        windows = {
            -- Send a final `\r` to the REPL with delay,
            send_delayed_cr_after_sending = true,
        },
    },
}


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
