
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true


local ls = require("luasnip")
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("c", {
    s({ trig = "main()", snippetType = "snippet" }, fmt([[
int main() {{
}}
]], {})),
    s({ trig = "int main()", snippetType = "snippet" }, fmt([[
int main() {{
}}
]], {})),
})



vim.lsp.config('clangd', {
    cmd = {
        "clangd",
        "-j=4",
        "--malloc-trim",
        "--background-index",
        "--pch-storage=memory",
    },
    filetypes = { "c" },
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 200,
    },
})

vim.lsp.enable("clangd")

