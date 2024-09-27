return {
    'yetone/avante.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    config = function()
        require('avante').setup({
            -- Disable repo_map feature
            repo_map = {
                enabled = false
            },
            -- Other options...
        })

        -- Add any keybindings for Avante here
        vim.keymap.set('n', '<leader>a', ':Avante<CR>', { noremap = true, silent = true })
    end
}