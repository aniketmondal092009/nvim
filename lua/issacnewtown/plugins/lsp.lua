return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "j-hui/fidget.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "stevearc/conform.nvim",
    },

    config = function()
        require("mason").setup()
        require("fidget").setup()


        vim.lsp.config("jdtls", {
            settings = {
                java = {
                    -- Custom eclipse.jdt.ls options go here
                },
            },
        })

        vim.lsp.config['lua_ls'] = {
          on_init = function(client)
            client.server_capabilities.documentFormattingProvider = false -- Disable formatting (formatting is done by stylua)

            if client.workspace_folders then
              local path = client.workspace_folders[1].name
              if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then return end
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
              runtime = {
                version = 'LuaJIT',
                path = { 'lua/?.lua', 'lua/?/init.lua' },
              },
              workspace = {
                checkThirdParty = false,
                -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
                --  See https://github.com/neovim/nvim-lspconfig/issues/3189
                library = vim.tbl_extend('force', vim.api.nvim_get_runtime_file('', true), {
                  '${3rd}/luv/library',
                  '${3rd}/busted/library',
                }),
              },
            })
          end,
          ---@type lspconfig.settings.lua_ls
          settings = {
            Lua = {
              format = { enable = false }, -- Disable formatting (formatting is done by stylua)
            },
          },
        }

        vim.lsp.config['ts_ls'] = {
            init_options = { hostInfo = 'neovim' },
            cmd = { 'typescript-language-server', '--stdio' },
            filetypes = {
                'javascript',
                'javascriptreact',
                'typescript',
                'typescriptreact',
            },
            root_dir = function(bufnr, on_dir)
                local root_markers = { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock' }
                root_markers = vim.fn.has('nvim-0.11.3') == 1 and { root_markers, { '.git' } }
                or vim.list_extend(root_markers, { '.git' })
                local deno_root = vim.fs.root(bufnr, { 'deno.json', 'deno.jsonc' })
                local deno_lock_root = vim.fs.root(bufnr, { 'deno.lock' })
                local project_root = vim.fs.root(bufnr, root_markers)
                if deno_lock_root and (not project_root or #deno_lock_root > #project_root) then
                    return
                end
                if deno_root and (not project_root or #deno_root >= #project_root) then
                    return
                end
                on_dir(project_root or vim.fn.getcwd())
            end,

            on_attach = function(client, bufnr)
                -- since im using prettier as my formatter
                -- it makes no sense 
                -- to add additional formatting from ts_ls
                client.server_capabilities.documentFormattingProvider = false
            end,
        }


        vim.lsp.enable({
            "lua_ls",
            -- "rust_analyzer",
            -- "ts_ls",
            "clangd",
            -- "jdtls",
        })


        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                -- completion = { border = "rounded" },
                documentation = { border = "rounded" }, 
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            })
        })


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
                vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "rounded" }) end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "grr", function() vim.lsp.buf.references() end, opts)
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

    end
}
