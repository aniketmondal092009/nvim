return {
    -- {
    --     "iamcco/markdown-preview.nvim",
    --     lazy = true,
    --     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    --     build = "cd app && yarn install",
    --     init = function()
    --         vim.g.mkdp_filetypes = { "markdown" }
    --     end,
    --     ft = { "markdown" },
    -- },

    {
        "obsidian-nvim/obsidian.nvim",
        version = "*", -- use latest release, remove to use latest commit
        ft = "markdown",
        ---@module 'obsidian'
        ---@type obsidian.config
        opts = {
            legacy_commands = false, -- this will be removed in the next major release
            workspaces = {
                {
                    name = "notes",
                    path = "~/dev/secondbrain",
                },
            },
        },
    }
}
