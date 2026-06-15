
return {
    'L3MON4D3/LuaSnip', 
    version = 'v2.*' ,
    config = function()
        local luasnip = require("luasnip")

        luasnip.config.set_config({
            enable_autosnippets = true,
        })

        vim.keymap.set({ "i", "s" }, "<C-J>", function() luasnip.jump(1) end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-K>", function() luasnip.jump(-1) end, { silent = true })
    end
}
