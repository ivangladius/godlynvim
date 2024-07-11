-- lua/plugins/lualine.lua
return {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
        require'lualine'.setup {
            options = {
                icons_enabled = true,
                theme = 'gruvbox',
            },
            sections = {
                lualine_b = {'branch'},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'fileformat', 'filetype'},
            },
        }
    end
}

