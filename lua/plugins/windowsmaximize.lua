-- lua/plugins/windowsmaximize.lua
return {
    'anuvyklack/windows.nvim',
    dependencies = {
        'anuvyklack/middleclass',
        'anuvyklack/animation.nvim'
    },
    config = function()
        require('windows').setup({
            -- Add your WindowsMaximize plugin configuration here
            autowidth = {
                enable = false,
                winwidth = 5,
                filetype = {
                    help = 2,
                }
            },
            ignore = {
                buftype = { 'quickfix' },
                filetype = { 'NvimTree', 'neo-tree', 'undotree', 'gundo', 'diff' },
            },
        })
    end
}

