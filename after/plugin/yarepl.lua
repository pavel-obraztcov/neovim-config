local yarepl = require('yarepl')

yarepl.setup {
    buflisted = true,
    scratch = true,
    ft = 'REPL',
    wincmd = 'belowright 15 split',
    metas = {
        ipython = { cmd = '/home/jupyter/.local/bin/ipython', formatter = yarepl.formatter.bracketed_pasting },
        python = { cmd = 'python', formatter = yarepl.formatter.trim_empty_lines },
        R = { cmd = 'R', formatter = yarepl.formatter.trim_empty_lines },
        utop = { cmd = 'utop', formatter = yarepl.formatter.trim_empty_lines },
        lua  = {cmd = 'lua', formatter = yarepl.formatter.trim_empty_lines },
        bash = { cmd = 'bash', formatter = yarepl.formatter.trim_empty_lines },
        zsh = { cmd = 'zsh', formatter = yarepl.formatter.bracketed_pasting },
        aichat = { cmd = 'aichat', formatter = yarepl.formatter.bracketed_pasting },
        radian = { cmd = 'radian', formatter = yarepl.formatter.bracketed_pasting },
    },
    close_on_exit = true,
    scroll_to_bottom_after_sending = true,
    os = {
        windows = {
            send_delayed_final_cr = true
        }
    }
}


-- Start a REPL and choose which one
vim.keymap.set("n", "<leader>rs", function()
    local win_id = vim.fn.win_getid()
    vim.cmd("Yarepl start")
    vim.cmd("1Yarepl attach_buffer")
    vim.fn.win_gotoid(win_id)
end)

-- Start an IPython REPL
vim.keymap.set("n", "<leader>rp", function()
    local win_id = vim.fn.win_getid()
    vim.cmd("Yarepl start ipython")
    vim.cmd("1Yarepl attach_buffer")
    vim.fn.win_gotoid(win_id)
end)

local function sleep(n)
  os.execute("sleep " .. tonumber(n))
end

-- Close REPL
vim.keymap.set("n", "<leader>rq", function()
    vim.cmd("Yarepl close")
    sleep(2)
    vim.cmd("Yarepl exec y")
end)

-- Key bindings to send stuff to REPL
-- Line
vim.keymap.set("n", "<leader>l", "<cmd>Yarepl send_line<CR>")
-- Line + go down
vim.keymap.set("n", "<leader>d", "<cmd>Yarepl send_line<CR>j")
-- Any movement
vim.keymap.set("n", "<leader>o", "<cmd>Yarepl send_operator<CR>")
-- Paragraph
vim.keymap.set("n", "<leader>pp", "<cmd>Yarepl send_operator<CR>ap")
-- Visual selection
vim.keymap.set("v", "<leader>ss", "<cmd>Yarepl source_visual<CR>")
-- Send the whole document
vim.keymap.set("n", "<leader>G", "mzggVG<cmd>Yarepl source_visual<CR><Esc>'z")
