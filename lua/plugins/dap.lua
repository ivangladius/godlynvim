-- lua/plugins/dap.lua
return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
        "leoluz/nvim-dap-go",
        "mfussenegger/nvim-dap-python",
        "nvim-neotest/nvim-nio",
        "nvim-telescope/telescope-dap.nvim"
    },
    config = function()
        -- DAP Setup
        local dap = require('dap')
        local dapui = require('dapui')
        local dap_virtual_text = require('nvim-dap-virtual-text')
        local dap_go = require('dap-go')
        local dap_python = require('dap-python')

        -- DAP UI setup
        dapui.setup({
            controls = {
                element = "repl",
                enabled = true,
                icons = {
                    disconnect = "",
                    pause = "",
                    play = "",
                    run_last = "",
                    step_back = "",
                    step_into = "",
                    step_out = "",
                    step_over = "",
                    terminate = ""
                }
            },
            element_mappings = {},
            expand_lines = true,
            floating = {
                border = "single",
                mappings = {
                    close = { "q", "<Esc>" }
                }
            },
            force_buffers = true,
            icons = {
                collapsed = "",
                current_frame = "",
                expanded = ""
            },
            layouts = { {
                elements = { {
                    id = "scopes",
                    size = 1 
                },
                -- {
                --   id = "breakpoints",
                --   size = 0.25
                -- }, {
                --   id = "stacks",
                --   size = 0.25
                -- }, {
                --   id = "watches",
                --   size = 0.25
                -- }
                },
                position = "bottom",
                size = 10
            },
            {
                elements = {
                {
                id = "stacks",
                size = 1
                },{
                    id = "watches",
                    size = 0.25
                },
                --   id = "repl",
                --   size = 0.5
                -- }, {
                --   id = "console",
                --   size = 0.5
                },
                position = "right",
                size = 60
            }},
            mappings = {
                edit = "e",
                -- expand = { "<CR>", "<2-LeftMouse>" },
                expand = { "<CR>", "<LeftRelease>", "<TAB>" },
                open = "o",
                remove = "d",
                repl = "r",
                toggle = "t"
            },
            render = {
                indent = 1,
                max_value_lines = 100
            }
        })

        -- DAP Virtual Text setup
        dap_virtual_text.setup {
            enabled = true,
            enabled_commands = true,
            highlight_changed_variables = true,
            highlight_new_as_changed = false,
            show_stop_reason = true,
            commented = true,
            only_first_definition = true,
            all_references = false,
            clear_on_continue = false,
            display_callback = function(variable, buf, stackframe, node, options)
                if options.virt_text_pos == 'inline' then
                    return ' = ' .. variable.value
                else
                    return variable.name .. ' = ' .. variable.value
                end
            end,
            virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',
            all_frames = false,
            virt_lines = false,
            virt_text_win_col = nil
        }

        -- DAP Go setup
        dap_go.setup({
            dap_configurations = {
                {
                    type = "go",
                    name = "Attach remote",
                    mode = "remote",
                    request = "attach",
                },
            },
            delve = {
                path = "dlv",
                initialize_timeout_sec = 20,
                port = "${port}",
                args = {},
                build_flags = "",
            },
        })

        -- DAP Python setup
        dap_python.setup('/usr/bin/python3')  -- Update this line to your Python path with debugpy

        -- DAP Keybindings
        vim.api.nvim_set_keymap("n", "<leader>di", ":lua require('dapui').toggle()<CR>", { noremap = true, silent = true })
        vim.keymap.set('n', '<M-]>', ":DapToggleBreakpoint<CR>", {})
        vim.keymap.set('n', '<M-9>', ":DapStepOut<CR>", {})
        vim.keymap.set('n', '<M-0>', ":DapStepOver<CR>", {})
        vim.keymap.set('n', '<M-->', ":DapStepIn<CR>", {})
        vim.keymap.set('n', '<M-=>', ":DapContinue<CR>", {})
        vim.keymap.set('n', '<M-+>', ":DapTerminate<CR>", {})

        -- DAP Telescope integration
        require('telescope').load_extension('dap')
        vim.keymap.set('n', '<leader>dc', ":lua require'telescope'.extensions.dap.commands{}<CR>", {})
        vim.keymap.set('n', '<leader>df', ":lua require'telescope'.extensions.dap.frames{}<CR>", {})
        vim.keymap.set('n', '<leader>db', ":lua require'telescope'.extensions.dap.list_breakpoints{}<CR>", {})
        vim.keymap.set('n', '<leader>de', ":lua require('dapui').eval()<CR>", {})
    end
}
