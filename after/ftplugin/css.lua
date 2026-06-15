
local ls = require("luasnip")
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("css", {
    s({ trig = "**", snippetType = "autosnippet" }, fmt([[
* {{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}}
]], {})),
})
