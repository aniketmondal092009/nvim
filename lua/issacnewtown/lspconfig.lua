


vim.diagnostic.config({
    update_in_insert = true,
    virtual_text = true,
    float = {
        focusable = false,
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    }
})


vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('Issacnewtown', {}),
    callback = function(e)
        local opts = { buffer = e.buf }
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "rounded" }) end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)

        vim.keymap.set("n", "grr", builtin.lsp_references)
        vim.keymap.set("n", "gri", builtin.lsp_implementations)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)


        local diagnostic_jump_prev = function()
            vim.diagnostic.jump({ count = -1, float = true })
        end
        local diagnostic_jump_next = function()
            vim.diagnostic.jump({ count = 1, float = true })
        end

        vim.keymap.set("n", "[d", diagnostic_jump_prev, opts)
        vim.keymap.set("n", "]d", diagnostic_jump_next, opts)
    end
})

