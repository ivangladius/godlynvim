-- lua/plugins/treesitter.lua
return {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
        require'nvim-treesitter.configs'.setup {
            highlight = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
            },
            textobjects = {
                enable = true,
            },
        }
    end
}
