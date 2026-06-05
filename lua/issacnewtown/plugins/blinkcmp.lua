return {
    'saghen/blink.cmp',
    dependencies = { 
        "rafamadriz/friendly-snippets",
        { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    },
    version = '1.*',
    config = function()
        local luasnip = require("luasnip")

        luasnip.config.set_config({
            enable_autosnippets = true,
        })

        vim.keymap.set({ "i", "s" }, "<C-J>", function() luasnip.jump(1) end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-K>", function() luasnip.jump(-1) end, { silent = true })

        require("blink.cmp").setup({
            keymap = { 
                preset = 'default',
                ["<Tab>"] = {
                    "snippet_forward",
                    "fallback",
                },

                ["<S-Tab>"] = {
                    "snippet_backward",
                    "fallback",
                },
            },

            appearance = {
                nerd_font_variant = 'mono'
            },

            completion = {
                documentation = { 
                    auto_show = true,
                    window = { border = "rounded" },
                },
                menu = {
                    draw = {
                        columns = {
                            { "label" },
                            { "kind" },
                            { "source_name" },
                        },
                        components = {
                            source_name = {
                                text = function(ctx)
                                    return "[" .. string.upper(ctx.item.source_name or "") .. "]"
                                end,
                            },
                        },
                    },
                },
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            cmdline = { enabled = false },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust" },


            snippets = {
                preset = "luasnip"
            },
        })
    end
}
