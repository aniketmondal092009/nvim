
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true

local capabilities = require('blink.cmp').get_lsp_capabilities()

vim.lsp.config('rust_analyzer', {
    capabilities = capabilities,
})
vim.lsp.enable("rust_analyzer")

