local lsp = require('lsp-zero').preset({})

local function get_lsps(user)
    if user == "cdsw" then
        return {
            'r_language_server',
            'lua_ls'
        }
    elseif user == "jupyter" then
        return {
            "pylsp",
            -- 'r_language_server',
            'lua_ls',
            -- 'ocamllsp'
        }
    else
        return {
            "pylsp",
            'r_language_server',
            'lua_ls',
            'ocamllsp'
        }
    end
end

local function get_user()
    local handle = io.popen("whoami")
    if handle == nil then
        return "pavel"
    else
        return handle:read("*l")
    end
end

local user = get_user()

lsp.ensure_installed(get_lsps(user))

lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-]>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-\\>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()


vim.diagnostic.config({
    virtual_text = true
})
