
return { 
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<M-g>", ":Git<CR>")

        vim.keymap.set("n", "gf", ":diffget //2<CR>")
        vim.keymap.set("n", "gh", ":diffget //3<CR>")
    end,
}
