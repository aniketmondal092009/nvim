return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup {
            default_file_explorer = false,

            columns = {
            },
            view_options = {
                show_hidden = true,
            },

            skip_confirm_for_simple_edits = true,
            use_default_keymaps = true,

            keymaps = {
                ["<C-p>"] = false,
                ["?"] = { "actions.show_help", mode = "n" },

                ["gd"] = function()
                    require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
                end,

            }
        }

        -- vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
}
