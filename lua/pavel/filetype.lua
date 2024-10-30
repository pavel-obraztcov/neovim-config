-- Set the correct file type for Processing files
vim.api.nvim_create_autocmd('BufRead', {
  group = vim.api.nvim_create_augroup('detect_processing_java', { clear = true }),
  desc = 'Set filetype for Processing Java files',
  pattern = { '*.pde' },
  callback = function()
    vim.cmd('set filetype=java')
    vim.keymap.set("n", "<F5>", ":w<CR>:!processing-java --sketch=`pwd` --run&<CR><CR>")
    vim.keymap.set("i", "<F5>", "<Esc>:w<CR>:!processing-java --sketch=`pwd` --run&<CR><CR>li")
  end,
})
