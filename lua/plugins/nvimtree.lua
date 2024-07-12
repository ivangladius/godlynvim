-- lua/plugins/nvimtree.lua
return {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("nvim-tree").setup({
            sort_by = "case_sensitive",
            view = {
                width = 20,
                adaptive_size = true,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
            git = {
                enable = false,
            }
        })

        -- NvimTree keybindings
        vim.keymap.set('n', '<M-b>', ":NvimTreeToggle<CR>", { desc = 'Toggle NvimTree' })
        vim.keymap.set('n', '<C-n>', ":NvimTreeResize -1<CR>", { desc = 'Resize NvimTree left' })
        vim.keymap.set('n', '<C-m>', ":NvimTreeResize +1<CR>", { desc = 'Resize NvimTree right' })
    end
}
