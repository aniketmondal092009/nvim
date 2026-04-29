return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup {
            default_file_explorer = true,
            view_options = {
                show_hidden = true,
            },

            columns = {
                -- "permissions",
                -- "size",
                -- "mtime",
            },
            constrain_cursor = "name",
            skip_confirm_for_simple_edits = true,
            use_default_keymaps = true,

            keymaps = {
                ["<C-p>"] = false,
                ["<leader>d"] = function()
                    require("oil").set_columns({ "permissions", "size", "mtime" })
                end,

            }
        }

        vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
}
