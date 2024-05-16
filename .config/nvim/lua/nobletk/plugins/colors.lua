-- function ColorMyPencils(color)
--     color = color or "rose-pine"
--     vim.cmd.colorscheme(color)
--
-- end

return {
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        opts = function()
            return {
                style = "storm",
                transparent = true,
                terminal = true,
                styles = {
                    sidebars = "dark",
                    floats = "dark",
                },
                sidebars = {
                    "qf",
                    "vista_kind",
                    -- "terminal",
                    "spectre_panel",
                    "startuptime",
                    "Outline",
                },
                vim.cmd.colorscheme "tokyonight-storm",
                -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" }),
                -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }),
            }
        end,

        -- on_highlights = function(hl, c)
        --     hl.CursorLineNr = { fg = c.orange, bold = true }
        --     -- hl.LineNr = { fg = c.orange, bold = true }
        --     hl.LineNrAbove = { fg = c.fg_gutter }
        --     hl.LineNrBelow = { fg = c.fg_gutter }
        --     local prompt = "#2d3149"
        --     hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
        --     hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
        --     hl.TelescopePromptNormal = { bg = prompt }
        --     hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
        --     hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
        --     hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
        --     hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
        -- end,
    },

    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     config = function()
    --         require('rose-pine').setup({
    --             disable_background = true,
    --         })
    --
    --         vim.cmd("colorscheme rose-pine")
    --
    --         ColorMyPencils()
    --     end
    -- },
}
