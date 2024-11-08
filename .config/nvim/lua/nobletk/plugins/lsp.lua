return {
    {
        "mfussenegger/nvim-jdtls",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "j-hui/fidget.nvim",
        },

        config = function()
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
                callback = function(event)
                    -- NOTE: Remember that lua is a real programming language, and as such it is possible
                    -- to define small helper and utility functions so you don't have to repeat yourself
                    -- many times.
                    --
                    -- In this case, we create a function that lets us more easily define mappings specific
                    -- for LSP related items. It sets the mode, buffer and description for us each time.
                    local map = function(keys, func, desc)
                        vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                    end

                    -- Jump to the definition of the word under your cursor.
                    --  This is where a variable was first declared, or where a function is defined, etc.
                    --  To jump back, press <C-T>.
                    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

                    -- Find references for the word under your cursor.
                    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

                    -- Jump to the implementation of the word under your cursor.
                    --  Useful when your language has ways of declaring types without an actual implementation.
                    map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

                    -- Jump to the type of the word under your cursor.
                    --  Useful when you're not sure what type a variable is and you want to see
                    --  the definition of its *type*, not where it was *defined*.
                    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

                    -- Fuzzy find all the symbols in your current document.
                    --  Symbols are things like variables, functions, types, etc.
                    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

                    -- Fuzzy find all the symbols in your current workspace
                    --  Similar to document symbols, except searches over your whole project.
                    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

                    -- Rename the variable under your cursor
                    --  Most Language Servers support renaming across files, etc.
                    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

                    -- Execute a code action, usually your cursor needs to be on top of an error
                    -- or a suggestion from your LSP for this to activate.
                    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

                    -- Opens a popup that displays documentation about the word under your cursor
                    --  See `:help K` for why this keymap
                    map('K', vim.lsp.buf.hover, 'Hover Documentation')

                    -- WARN: This is not Goto Definition, this is Goto Declaration.
                    --  For example, in C this would take you to the header
                    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                    map('<leader>vd', vim.diagnostic.open_float, '[V]im [D]ignostic')
                    map('[d', vim.diagnostic.goto_next, '[[]next [D]iagnostic')
                    map(']d', vim.diagnostic.goto_prev, '[]]prev [D]iagnostic')
                end,
            })

            local cmp = require('cmp')
            local cmp_lsp = require("cmp_nvim_lsp")
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities())

            require("luasnip.loaders.from_vscode").lazy_load()
            require("fidget").setup({})
            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "html",
                    "ts_ls",
                    "emmet_ls",
                    "gopls",
                    "sqlls",
                    "jdtls",
                },
                handlers = {
                    function(server_name) -- default handler (optional)
                        require("lspconfig")[server_name].setup {
                            capabilities = capabilities,
                        }
                    end,

                    ["lua_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup {
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    runtime = {
                                        version = "LuaJIT",
                                    },
                                    diagnostics = {
                                        globals = { "vim" },
                                    },
                                    workspace = {
                                        library = vim.api.nvim_get_runtime_file("", true),
                                        checkThirdParty = false,
                                    },
                                    telemetry = {
                                        enable = false,
                                    },
                                }
                            }
                        }
                    end,

                    ["ts_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.ts_ls.setup {
                            capabilities = capabilities,
                        }
                    end,

                    ["html"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.html.setup {
                            capabilities = capabilities,
                        }
                    end,


                    ["emmet_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.emmet_ls.setup {
                            capabilities = capabilities,
                            filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
                        }
                    end,

                    ["gopls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.gopls.setup {
                            capabilities = capabilities,
                            filetypes = { "go", "gomod", "gowork", "gotmpl", "tmpl", "tmp.html" },
                            settings = {
                                gopls = {
                                    templateExtensions = { "gotmpl", "tmpl", "tmpl.html" },
                                    completeUnimported = true,
                                    usePlaceHolders = true,
                                    analyses = {
                                        unusedparams = true,
                                    },
                                    hints = {
                                        assignVariableTypes = true,
                                        compositeLiteralFields = true,
                                        compositeLiteralTypes = true,
                                        constantValues = true,
                                        functionTypeParameters = true,
                                        parameterNames = true,
                                        rangeVariableTypes = true,
                                    },
                                },
                            },
                        }
                    end,

                    ["sqlls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.sqlls.setup {
                            capabilities = capabilities,
                            filetypes = { "sql", "mysql" },
                        }
                    end,

                    ["clangd"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.clangd.setup {
                            capabilities = capabilities,
                            settings = {
                                clangd = {
                                    fallbackFlags = { "--fallback-style=Google" },
                                },
                            },
                        }
                    end,

                },
            })

            local cmp_select = { behavior = cmp.SelectBehavior.Select }


            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
                    { name = 'buffer' },
                    { name = 'path' },

                    -- {
                    --     name = "html-css",
                    --     option = {
                    --         max_count = {}, -- not ready yet
                    --         enable_on = {
                    --             "html"
                    --         },                                           -- set the file types you want the plugin to work on
                    --         file_extensions = { "css", "sass", "less" }, -- set the local filetypes from which you want to derive classes
                    --         style_sheets = {
                    --             -- example of remote styles, only css no js for now
                    --             "https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css",
                    --             "https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
                    --         }
                    --     }
                    -- }
                })
            })

            cmp.setup.filetype({ 'sql' }, {
                sources = {
                    { name = 'vim-dadbod-completion' },
                    { name = 'buffer' },
                },
            })

            vim.diagnostic.config({
                -- update_in_insert = true,
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })
        end
    },

    -- {
    --     "Jezda1337/nvim-html-css",
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter",
    --         "nvim-lua/plenary.nvim"
    --     },
    --     config = function()
    --         require("html-css"):setup()
    --     end,
    --     lazy = false,
    -- },
}
