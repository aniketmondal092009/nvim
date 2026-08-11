
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

