local builtin = require("telescope.builtin")
local global_opts = require("issacnewtown.telescope.command_palette_opts")

return {
    {
        name = "Change theme: choose a colorscheme",
        fn = function()
            builtin.colorscheme(global_opts)
        end,
    },
    {
        name = "Compile: run a command to compile your project",
        fn = function() vim.cmd("Compile") end,
    },
    {
        name = "Lazy: see installed plugins, update or remove plugins",
        fn = function()
            vim.cmd("Lazy")
        end,
    },
    {
        name = "Toggle terminal: toggle split terminal",
        fn = function()
            vim.cmd("ToggleTerminal")
        end,
    },
    {
        name = "Lsp info: check active lsp servers, and other lsp related information",
        fn = function()
            vim.cmd("checkhealth vim.lsp")
        end,
    },
    {
        name = "Restart: reload neovim",
        fn = function()
            vim.cmd("restart")
        end,
    },
    {
        name = "Builtin pickers: see the list of builtin telescope pickers available",
        fn = function()
            builtin.builtin(global_opts)
        end,
    },
    {
        name = "Find files: find files in the current working directory",
        fn = function()
            local opts = {
                previewer = false,
                borderchars = { "", "", "", "", "", "", "", "" },
            }
            builtin.find_files(opts)
        end,
    },
    {
        name = "Search in current buffer: find word in current buffer",
        fn = function()
            builtin.current_buffer_fuzzy_find(global_opts)
        end,
    },
    {
        name = "Help tags: fuzzy find help tags",
        fn = function()
            builtin.help_tags(global_opts)
        end,
    },
    {
        name = "Harpoon marks: show available harpoon marks",
        fn = function()
            require("telescope").extensions.harpoon.marks(global_opts)
        end,
    },
    {
        name = "Markdown preview: toggle preview for markdown files",
        fn = function()
            vim.cmd([[MarkdownPreviewToggle]])
        end,
    },
    {
        name = "Git: show various git info",
        fn = function()
            vim.cmd([[Git]])
        end,
    },
    {
        name = "Git status: show git status",
        fn = function()
            vim.cmd([[Git status]])
        end,
    },
    {
        name = "Git commit: see list of all commits, commit details, switch to an older commit",
        fn = function()
            vim.cmd([[Telescope git_commits]])
        end,
    },
}
