return {
    'ThePrimeagen/harpoon',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },

    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", function() mark.add_file() end)
        vim.keymap.set("n", "<leader><leader>", function() ui.toggle_quick_menu() end)

        vim.keymap.set("n", "<M-1>", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<M-2>", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<M-3>", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<M-4>", function() ui.nav_file(4) end)
    end

}
