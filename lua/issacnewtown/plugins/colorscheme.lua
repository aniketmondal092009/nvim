return {
    {
        "atlas.nvim",
        dir = "~/dev/atlastheme",
        -- lazy = false,
        -- priority = 1000,

        config = function()
            require('atlas').setup({
                variant = "main",

                disable_background = true,

                styles = {
                    italic = false,
                },
            })


            -- vim.cmd([[color atlas]])
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
                overrides = function(colors) -- add/modify highlights
                    local theme = colors.theme

                    return {
                        NormalFloat = { bg = "none" },
                        FloatBorder = { bg = "none" },
                        FloatTitle = { bg = "none" },

                        -- Save an hlgroup with dark background and dimmed foreground
                        -- so that you can use it where your still want darker windows.
                        -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

                        -- Popular plugins that open floats will link to NormalFloat by default;
                        -- set their background accordingly if you wish to keep them dark and borderless
                        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

                        TelescopeSelectionCaret = { fg = "white", bg = "NONE" },                        

                        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
                        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                        PmenuSbar = { bg = theme.ui.bg_m1 },
                        PmenuThumb = { bg = theme.ui.bg_p2 },
                    }
                end    

            })
        end
    },

    { 
        "slugbyte/lackluster.nvim",
        config = function()
            vim.cmd([[colorscheme lackluster-night]])
        end,
    },

    { "vague-theme/vague.nvim" },
}
