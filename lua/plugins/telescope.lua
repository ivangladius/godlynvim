-- lua/plugins/telescope.lua
return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
        'BurntSushi/ripgrep',
        'sharkdp/fd',
        'nvim-treesitter/nvim-treesitter',
        'kyazdani42/nvim-web-devicons',
    },
    config = function()
        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-u>"] = false,
                        ["<C-d>"] = false,
                    },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })

        -- Load extensions
        pcall(require('telescope').load_extension, 'fzf')

        -- Telescope keybindings
        local map = vim.keymap.set
        map('n', '<leader>ir', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
        map('n', '<leader>if', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
        map('n', '<leader>/', function()
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })
        map('n', '<leader>iw', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
        map('n', '<leader>ie', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
        map('n', '<leader>iE', ":IvanFindFileFromHome<CR>", { desc = '[S]earch [F]iles' })
        map('n', '<leader>iC', ":IvanFindConfig<CR>", { desc = 'Open config' })
        map('n', '<leader>ih', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
        map('n', '<leader>is', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
        map('n', '<leader>ia', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
        map('n', '<leader>iA', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
        map('n', '<leader>id', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
        map('n', '<leader>ic', require('telescope.builtin').commands, { desc = '[S]earch [C]ommands' })
        map('n', '<leader>im', require('telescope.builtin').man_pages, { desc = '[S]earch [M]an pages' })
        map('n', '<leader>iq', require('telescope.builtin').registers, { desc = '[S]earch [R]egisters' })
        map('n', '<leader>gs', require('telescope.builtin').git_status, { desc = '[G]it [S]tatus' })
        map('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
    end
}

