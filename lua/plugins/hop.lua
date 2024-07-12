return {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
        require("hop").setup()
        
        vim.api.nvim_set_keymap("n", "s", ":HopChar1MW<cr>", { silent = true })
        vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
        vim.api.nvim_set_keymap("n", "9", ":IvanSnipeCopyWord<cr>", { silent = true })
        vim.api.nvim_set_keymap("n", "<leader>9", ":IvanSnipeCopyWholeWord<cr>", { silent = true })
        vim.api.nvim_set_keymap("n", "<leader>0", ":IvanSnipeCopyLine<cr>", { silent = true })

        vim.api.nvim_create_user_command('IvanSnipeCopyWord', function()
            vim.cmd('HopChar1MW')
            vim.cmd('normal! yiw')
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-o>', true, false, true), 'n')
        end, {})

        vim.api.nvim_create_user_command('IvanSnipeCopyWholeWord', function()
            vim.cmd('HopChar1MW')
            vim.cmd('normal! yiW')
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-o>', true, false, true), 'n')
        end, {})

        vim.api.nvim_create_user_command('IvanSnipeCopyLine', function()
            vim.cmd('HopLine')
            vim.cmd('normal! yy')
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-o>', true, false, true), 'n')
        end, {})
    end,
}
