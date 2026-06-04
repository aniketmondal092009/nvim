return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    config = function()
        local actions = require("telescope.actions")
        local action_layout = require("telescope.actions.layout")
        require('telescope').setup({
            defaults = {
                previewer = false,
                borderchars = { "", "", "", "", "", "", "", "" },
                file_ignore_patterns = { "%.class$" },
                mappings = {
                    n = {
                        ["<M-p>"] = action_layout.toggle_preview,
                    },
                    i = {
                        ["<esc>"] = actions.close,
                        ["<M-p>"] = action_layout.toggle_preview,
                    },
                }
            }
        })
        require('telescope').load_extension('fzf')
        require("telescope").load_extension('harpoon')


        local builtin = require("telescope.builtin")
        local themes = require("telescope.themes")

        vim.keymap.set("n", "<C-p>", function ()
            local opts = {
                previewer = false,
                hidden = true,
                borderchars = { "", "", "", "", "", "", "", "" },
            }

            local ok = pcall(function() builtin.git_files(opts) end)
            if not ok then
                builtin.find_files(opts)
            end
        end)

        vim.keymap.set("n", "<M-h>", builtin.help_tags)
        vim.keymap.set('n', '<leader>W', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<C-s>', function()
            local opts = {
                previewer = false,
                layout_strategy = "bottom_pane",
                sorting_strategy = "ascending",
                layout_config = {
                    height = 15,
                    prompt_position = "bottom",
                }
            }
            builtin.current_buffer_fuzzy_find(opts)
        end)

        vim.keymap.set("n", "<M-x>", function()
            local opts = {
                layout_strategy = "bottom_pane",
                layout_config = {
                    height = 15,
                    prompt_position = "bottom",
                }
            }
            builtin.builtin(opts)
        end)


        require("issacnewtown.telescope.multigrep").setup()
        require("issacnewtown.telescope.command_palette").setup()
    end
}
