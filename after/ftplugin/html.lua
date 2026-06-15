
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("html", {
    s({ trig = "!", snippetType = "snippet" }, fmt([[
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{}</title>
</head>
<body>
  {}
</body>
</html>
]], { i(1, "Title"), i(2) })),
    s({ trig = "linkcss", snippetType = "autosnippet" }, fmt([[<link rel="stylesheet" href="style.css" />]], {})),
})
