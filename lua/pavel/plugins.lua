local function run_pack_hook(plugin_name, command)
    return function(ev)
        if ev.data.kind ~= "install" and ev.data.kind ~= "update" then
            return
        end

        if ev.data.spec.name ~= plugin_name then
            return
        end

        if not ev.data.active then
            pcall(vim.cmd, "packadd " .. plugin_name)
        end

        pcall(vim.cmd, command)
    end
end

vim.api.nvim_create_autocmd("PackChanged", {
    callback = run_pack_hook("nvim-treesitter", "TSUpdate"),
})

vim.api.nvim_create_autocmd("PackChanged", {
    callback = run_pack_hook("mason.nvim", "MasonUpdate"),
})

vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/morhetz/gruvbox",
    "https://github.com/folke/tokyonight.nvim",
    { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    "https://github.com/ThePrimeagen/harpoon",
    "https://github.com/mbbill/undotree",
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/tpope/vim-surround",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/williamboman/mason.nvim",
    "https://github.com/williamboman/mason-lspconfig.nvim",
    "https://github.com/hrsh7th/nvim-cmp",
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/hrsh7th/cmp-buffer",
    "https://github.com/hrsh7th/cmp-path",
    "https://github.com/hrsh7th/cmp-cmdline",
    "https://github.com/numToStr/Comment.nvim",
    "https://github.com/milanglacier/yarepl.nvim",
    "https://github.com/ThePrimeagen/vim-be-good",
    "https://github.com/preservim/tagbar",
    "https://github.com/github/copilot.vim",
    "https://github.com/sakshamgupta05/vim-todo-highlight",
}, {
    confirm = false,
    load = true,
})
