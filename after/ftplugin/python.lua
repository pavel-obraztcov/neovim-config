local user = io.popen("whoami"):read("*l")

if user == "cdsw" then
    local id = vim.lsp.start({
        name = "pylsp",
        cmd = {"/home/cdsw/.local/bin/pylsp"},
        root_dir = vim.fs.dirname(
            vim.fs.find(
                {'setup.py', 'pyproject.toml', '.git'},
                { upward = true })[1])
    })
    vim.lsp.buf_attach_client(0, id)
end
