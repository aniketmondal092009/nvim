return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    config = function()
        require("telescope").setup({
            defaults = {
                borderchars = { "", "", "", "", "", "", "", "" },
                file_ignore_patterns = { "%.class$" },
            }
        })

        require('telescope').load_extension('fzf')

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<C-f>", function()
            local opts = {
            }

            builtin.find_files(opts)
        end)
        vim.keymap.set("n", "<C-p>", function ()
            local opts = {
                previewer = false,
                borderchars = { "", "", "", "", "", "", "", "" }
            }
            builtin.find_files(opts)
        end)
        vim.keymap.set("n", "<leader>w", builtin.live_grep)
    end
}
