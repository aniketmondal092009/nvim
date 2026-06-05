return {
    "ibhagwan/fzf-lua",
    config = function()
        local fzf = require("fzf-lua")
        fzf.setup({
            winopts = {
                preview = {
                    default = "none",
                },
                border = "none",
            },
            grep = {
                rg_opts = "--color=never --no-heading --with-filename --line-number --column --smart-case",
            },
            fzf_opts = {
                ["--layout"] = "default",
                ["--cycle"] = true,
            },
            files = {
                cwd_prompt = false,
                cwd_header = false,
            },
        })


        vim.keymap.set("n", "<C-p>", function()
            fzf.files({ previewer = false })
        end)
    end,
}
