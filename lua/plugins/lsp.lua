-- lua/plugins/lsp.lua
return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
    },
    config = function()
        -- Setup Mason
        require('mason').setup()
        require('mason-lspconfig').setup {
            ensure_installed = { "lua_ls", "pyright", "ts_ls", "clangd", "rust_analyzer", "zls", "ols", "gopls"},
        }

        -- Setup nvim-cmp
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            completion = {
                completeopt = 'menu,menuone,noinsert',
                autocomplete = false,
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete {},
                ['<Tab>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                },
                -- ['<CR>'] = cmp.mapping.confirm {
                    --   behavior = cmp.ConfirmBehavior.Replace,
                    --   select = false,
                    -- },
                    -- ['<Tab>'] = cmp.mapping(function(fallback)
                        --   if cmp.visible() then
                        --     cmp.select_next_item()
                        --   elseif luasnip.expand_or_locally_jumpable() then
                        --     luasnip.expand_or_jump()
                        --   else
                        --     fallback()
                        --   end
                        -- end, { 'i', 's' }),
                        ['<S-Tab>'] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            elseif luasnip.locally_jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end, { 'i', 's' }),
                    },
                    sources = {
                        { name = 'nvim_lsp' },
                        { name = 'luasnip' },
                    },
                }        -- Use cmdline & path source for ':'
                cmp.setup.cmdline(':', {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = cmp.config.sources({
                        { name = 'path' }
                    }, {
                        { name = 'cmdline' }
                    })
                })

        -- Setup lspconfig
        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local on_attach = function(client, bufnr)
            local map = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end
                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            map('<leader>lr', vim.lsp.buf.rename, '[R]e[n]ame')
            map('<leader>la', vim.lsp.buf.code_action, '[C]ode [A]ction')
            map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
            map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
            map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
            map('<leader>ls', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
            map('<leader>lS', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
            map('<leader>ll', ":LspStop<cr>", '[S]top Lsp')
            map('<leader>lL', ":LspStart<cr>", '[S]tart Lsp')
            map('K', vim.lsp.buf.hover, 'Hover Documentation')
            map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            map('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
            map('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
            map('<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, '[W]orkspace [L]ist Folders')

            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                vim.lsp.buf.format()
            end, { desc = 'Format current buffer with LSP' })
        end

        -- Lua
        lspconfig.lua_ls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }

        -- Zig
        lspconfig.zls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }

        -- Rust
        lspconfig.rust_analyzer.setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }

        -- Python
        lspconfig.pyright.setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }

        -- Golang
        lspconfig.gopls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }


        -- -- Elixir
        -- lspconfig.elixir_ls.setup {
        --     on_attach = on_attach,
        --     capabilities = capabilities,
        -- }

        -- TypeScript
        lspconfig.ts_ls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }

        -- C/C++
        lspconfig.clangd.setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
        
        -- Odin
        lspconfig.ols.setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }


        -- Diagnostic configuration
        vim.diagnostic.config({
            virtual_text = true,
            signs = false,
            update_in_insert = true,
            underline = true,
            severity_sort = true,
            float = {
                source = "always",
            },
        })
    end
}

