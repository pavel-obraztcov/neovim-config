vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", function()
    vim.cmd("Explore")
    vim.cmd("set number")
    vim.cmd("set relativenumber")
end)
vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("n", "<leader>v", "<C-v>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- this is for moving text around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- append the next line to the end of the current line not moving the cursor
vim.keymap.set("n", "J", "mzJ`z")
-- keep the cursor at the middle of the screen when moving
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- go to the first line of previous paragraph
vim.keymap.set("n", "<leader>[", "2{w")
-- go to the first line of next paragraph
vim.keymap.set("n", "<leader>]", "}/^.<CR>")

-- paste over a selection without replacing the value in the register
vim.keymap.set("x", "<leader>p", [["_dP]])

--use <leader>y to copy to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete to the void register
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])


-- Quick Fix navigation
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz")
-- TODO: make this work for location list
-- vim.keymap.set("n", "", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "", "<cmd>lprev<CR>zz")

-- Replace the word you're on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- source file more easily
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
