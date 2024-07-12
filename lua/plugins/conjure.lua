-- lua/plugins/conjure.lua
return {
    'Olical/conjure',
    dependencies = {
        'clojure-vim/vim-jack-in',
        'radenling/vim-dispatch-neovim'
    },
    config = function()
        -- Conjure does not require much configuration
        -- Vim-jack-in settings can be added if needed

        -- Setup Conjure keybindings for Lisp modes
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {"clojure", "scheme", "lisp"},
            callback = function()
                local wk = require("which-key")
                wk.register({
                    ["<localleader>c"] = { name = "+conjure" },
                    ["<localleader>cc"] = { ":ConjureConnect<CR>", "Connect to Clojure REPL" },
                    ["<localleader>cj"] = { ":ConjureEvalCurrentFile<CR>", "Evaluate current file" },
                    ["<localleader>ce"] = { ":ConjureEvalCurrentForm<CR>", "Evaluate current form" },
                    ["<localleader>cr"] = { ":ConjureEvalRootForm<CR>", "Evaluate root form" },
                    ["<localleader>cb"] = { ":ConjureEvalCurrentBuffer<CR>", "Evaluate current buffer" },
                    ["<localleader>cl"] = { ":ConjureLogJumpTo<CR>", "Jump to Conjure log" },
                }, { buffer = 0 })
            end,
        })
    end
}
