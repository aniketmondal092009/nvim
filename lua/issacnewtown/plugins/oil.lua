return {
    "stevearc/oil.nvim",
    config = function()
        local show_details = false

        require("oil").setup {
            default_file_explorer = true,
            view_options = {
                show_hidden = true,
            },

            columns = {
                -- "icon",
                "permissions",
                "size",
                "mtime",
            },
            constrain_cursor = "name",
            skip_confirm_for_simple_edits = true,
            use_default_keymaps = true,
            keymaps = {
                ["<C-p>"] = false,
                ["<C-s>"] = false,
                ["."] = function()
                    show_details = not show_details

                    if show_details then
                        require("oil").set_columns({ "permissions", "size", "mtime" })
                    else
                        require("oil").set_columns({})
                    end
                end,

            }
        }

        vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
}
