return {
    {
        "williamboman/mason.nvim",
        build = ":MasonInstallAll",
        config = function()
            require("mason").setup{}
            vim.api.nvim_create_user_command("MasonInstallAll",function ()
                vim.cmd('MasonUpdate')
                local ensure_installed = {
                    "bash-language-server",
                    "css-lsp",
                    "eslint-lsp",
                    "html-lsp",
                    "json-lsp",
                    "lua-language-server",
                    "python-lsp-server",
                    "tailwindcss-language-server",
                    "typescript-language-server",
                }
                vim.cmd('MasonInstall ' .. table.concat(ensure_installed, ' '))
            end, { desc = "install all lsp tools" })
        end,
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup()
            local lspconfig = require("lspconfig")
            lspconfig.pylsp.setup {}
            lspconfig.tsserver.setup {}
            lspconfig.tailwindcss.setup {}
            lspconfig.jsonls.setup {}
            lspconfig.html.setup {}
            lspconfig.eslint.setup {}
            lspconfig.cssls.setup {}
            lspconfig.bashls.setup {}
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = {
                                'vim',
                                'require'
                            },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                            enable = false,
                        },
                    },
                }
            }

            -- LSPキーマッピング設定
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- LSPが添付された際のキーマッピングをここに設定
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set('n', '<space>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', '<space>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                end,

            })
        end
    },
}
