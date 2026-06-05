return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    init = function()
        local parsers = {
            "lua",
            "vim",
            "vimdoc",
            "query",
            "javascript",
            "typescript",
            "tsx",
            "html",
            "css",
            "json",
            "gitignore",
            "go",
        }

        local group = vim.api.nvim_create_augroup("Treesitter_group", { clear = true })
        vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
            group = group,
            callback = function()
                if vim.bo.buftype ~= "" then
                    return
                end
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    vim.notify(
                        "File larger than 100KB treesitter disabled for performance",
                        vim.log.levels.WARN,
                        {title = "Treesitter"}
                    )
                    return
                end

                pcall(vim.treesitter.start, 0)
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            group = group,
            pattern = "VeryLazy",
            once = true,
            callback = function()
                require("nvim-treesitter").install(parsers)
            end,
        })
    end,
}
