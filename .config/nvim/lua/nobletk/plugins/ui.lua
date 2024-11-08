return {
    {
        "folke/noice.nvim",
        -- event = "VeryLazy",
        opts = {
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                    },
                },
                presets = {
                    bottom_search = true,         -- use a classic bottom cmdline for search
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true,        -- add a border to hover docs and signature help
                },
            })
        end
    },

    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#000000",
            timeout = 3000,
        },
    },


    {
        'nvim-tree/nvim-web-devicons',
        config = function()
            require 'nvim-web-devicons'.setup({
                -- your personnal icons can go here (to override)
                -- you can specify color or cterm_color instead of specifying both of them
                -- DevIcon will be appended to `name`
                override = {
                    zsh = {
                        icon = "",
                        color = "#428850",
                        cterm_color = "65",
                        name = "Zsh"
                    }
                },
                -- globally enable different highlight colors per icon (default to true)
                -- if set to false all icons will have the default icon's color
                color_icons = true,
                -- globally enable default icons (default to false)
                -- will get overriden by `get_icons` option
                default = true,
                -- globally enable "strict" selection of icons - icon will be looked up in
                -- different tables, first by filename, and if not found by extension; this
                -- prevents cases when file doesn't have any extension but still gets some icon
                -- because its name happened to match some extension (default to false)
                strict = true,
                -- same as `override` but specifically for overrides by filename
                -- takes effect when `strict` is true
                override_by_filename = {
                    [".gitignore"] = {
                        icon = "",
                        color = "#f1502f",
                        name = "Gitignore"
                    }
                },
                -- same as `override` but specifically for overrides by extension
                -- takes effect when `strict` is true
                override_by_extension = {
                    ["log"] = {
                        icon = "",
                        color = "#81e043",
                        name = "Log"
                    }
                },
            })
        end
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        -- event = "VeryLazy",
        config = function()
            require('lualine').setup {
                sections = {
                    lualine_c = {
                        {
                            'filename',
                            path = 3,
                            -- shorting_target = 40,
                        },
                    },
                    lualine_x = {
                        {
                            require("noice").api.statusline.mode.get,
                            cond = require("noice").api.statusline.mode.has,
                            color = { fg = "#FFA066" },
                        }
                    },
                },
                options = {
                    theme = function()
                        local colors = {
                            fujiWhite = "#DCD7BA",
                            springGreen = "#98BB6C",
                            crystalBlue = "#7E9CD8",
                            waveAqua1 = "#6A9589",
                            waveBlue1 = "#223249",
                            oniViolet = "#957FB8",
                            surimiOrange = "#FFA066",
                            roninYellow = "#FF9E3B",
                            background = "#141b23",
                        }
                        local theme = {
                            normal = {
                                a = { bg = colors.fujiWhite, fg = colors.background },
                                b = { bg = colors.crystalBlue, fg = colors.background },
                                c = { bg = colors.background, fg = colors.fujiWhite },
                            },
                            insert = {
                                a = { bg = colors.springGreen, fg = colors.background },
                                b = { bg = colors.waveAqua1, fg = colors.background },
                                c = { bg = colors.background, fg = colors.fujiWhite },
                            },
                            visual = {
                                a = { bg = colors.oniViolet, fg = colors.background },
                                b = { bg = colors.waveAqua1, fg = colors.background },
                                c = { bg = colors.background, fg = colors.fujiWhite },
                            },
                            replace = {
                                a = { bg = colors.samuraiRed, fg = colors.background },
                                b = { bg = colors.waveAqua1, fg = colors.background },
                                c = { bg = colors.background, fg = colors.fujiWhite },
                            },
                            command = {
                                a = { bg = colors.roninYellow, fg = colors.background },
                                b = { bg = colors.waveAqua1, fg = colors.background },
                                c = { bg = colors.background, fg = colors.fujiWhite },
                            },
                            inactive = {
                                a = { bg = colors.fujiGray, fg = colors.background },
                                b = { bg = colors.waveAqua1, fg = colors.background },
                                c = { bg = colors.background, fg = colors.fujiWhite },
                            },
                        }
                        return theme
                    end,
                    component_separators = '',
                    section_separators = { left = '', right = '' },
                },
            }
        end
    },

    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },

    {
        'echasnovski/mini.nvim',
        config = function()
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [']quote
            --  - ci'  - [C]hange [I]nside [']quote
            require('mini.ai').setup { n_lines = 500 }

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            --
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            require('mini.surround').setup()
        end
    },

    -- Highlight todo, notes, etc in comments
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false }
    },

    {
        'folke/which-key.nvim',
        event = 'vimEnter',
        config = function()
            local which_key = require('which-key')

            which_key.setup()

            which_key.register({
                { "", group = "[J]ava" },
                { "", desc = "<leader>J_", hidden = true },
                -- { "<leader>J",  group = "[J]ava" },
                -- { "<leader>J_", hidden = true },
            })
        end
    },
}
