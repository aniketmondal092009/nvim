return {

    {
        "atlas.nvim",
        dir = "~/dev/atlastheme",

        lazy = false,
        priority = 1000,

        config = function ()
            require('atlas').setup({
                variant = "main",

                disable_background = true,

                styles = {
                    italic = false,
                },
            })

            vim.cmd([[colorscheme atlas]])

            local highlight_groups = {
                -- "NormalFloat", 
                -- "FloatBorder", 
                -- "Pmenu",       -- Popup menu (completions)
                -- "PmenuSel",    -- Selected item in popup
                -- "NormalNC",    -- Normal text in non-current windows
            }

            -- vim.api.nvim_set_hl(0, "Pmenu", { bg = "#333333" })
            -- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#444444" })
            -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
            -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
            
        end

    },



    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        lazy = true,
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = false,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = true,
            })


        end,
    },

    {
        "rebelot/kanagawa.nvim",
        lazy = true,
        config = function ()
            require('kanagawa').setup({
                colors = {                   -- add/modify theme and palette colors
                    palette = {},
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = "none"
                            }
                        }
                    },
                },
                background = {               -- map the value of 'background' option to a theme
                    dark = "dragon",           -- try "dragon" !
                    light = "lotus"
                },
            })


            -- vim.cmd([[colorscheme kanagawa]])
        end
    },

}
