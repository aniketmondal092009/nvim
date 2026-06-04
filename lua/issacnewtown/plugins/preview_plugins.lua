return {
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_auto_close = 1
        end,
        ft = { "markdown" },
        config = function()
            vim.keymap.set("n", "<leader>mm", ":MarkdownPreviewToggle<cr>")
        end
    },

}
