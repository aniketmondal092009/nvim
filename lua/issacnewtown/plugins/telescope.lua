return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        -- {
        --     "echasnovski/mini.icons",
        --     opts = {
        --         filetype = {
        --             java = { glyph = 'J', hl = 'MiniIconsOrange' },
        --             c = { glyph = 'C', hl = 'MiniIconsBlue' },
        --             fish = { glyph = '>_', hl = 'MiniIconsBlue' },
        --             zsh = { glyph = '>_', hl = 'MiniIconsOrange' },
        --             bash = { glyph = '>_', hl = 'MiniIconsBlue' },
        --
        --
        --         },
        --         extension = {
        --             h = { glyph = 'h', hl = 'MiniIconsBlue' },
        --             sh = { glyph = '󰆍', hl = 'MiniIconsBlue' },
        --         },
        --         file = {
        --             ["README.md"] = { glyph = '󰍔', hl = 'MiniIconsGrey'   },
        --             ["Makefile"] = { glyph = 'M', hl = 'MiniIconsGrey'   },
        --         }
        --     },
        --     lazy = true,
        --     specs = {
        --         { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
        --     },
        --     init = function()
        --         package.preload["nvim-web-devicons"] = function()
        --             require("mini.icons").mock_nvim_web_devicons()
        --             return package.loaded["nvim-web-devicons"]
        --         end
        --     end,
        -- },
        -- { "nvim-tree/nvim-web-devicons" },
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
        -- vim.keymap.set("n", "<C-f>", builtin.find_files)
        vim.keymap.set("n", "<C-f>", function()
            local opts = {
                -- prompt_title = "",
            }

            builtin.find_files(opts)
        end)
        vim.keymap.set("n", "<C-p>", function ()
            local opts = {
                -- layout_config = {
                --     height = 20,
                --     width = 0.5,
                -- },                
                previewer = false,
                -- prompt_title = " ",
                borderchars = { "", "", "", "", "", "", "", "" }
            }
            builtin.find_files(opts)
        end)
        vim.keymap.set("n", "<leader>w", builtin.live_grep)
    end
}
