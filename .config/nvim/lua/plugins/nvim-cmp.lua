return {
    "hrsh7th/nvim-cmp",
    --event = "InsertEnter",
    dependencies = {
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/vim-vsnip",
	"neovim/nvim-lspconfig",
	"onsails/lspkind-nvim",
	{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
	"saadparwaiz1/cmp_luasnip",
	"windwp/nvim-autopairs",
    },
    config = function()
        local cmp = require("cmp")
        local lsp_kind = require("lspkind")
        lsp_kind.init()
        cmp.setup({
            preselect = cmp.PreselectMode.None,
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            --view = {
            --    entries = "bordered",
            --},
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ['<tab>'] = cmp.mapping.confirm({ select = true }),
            }),

            sources = {
                { name = "nvim_lsp_signature_help", group_index = 1 },
                { name = "luasnip",                 max_item_count = 5,  group_index = 1 },
                { name = "nvim_lsp",                max_item_count = 20, group_index = 1 },
                { name = "nvim_lua",                group_index = 1 },
                { name = "vim-dadbod-completion",   group_index = 1 },
                { name = "path",                    group_index = 2 },
                { name = "buffer",                  keyword_length = 2,  max_item_count = 5, group_index = 2 },
            },
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                    { name = 'cmdline' }
                }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })

    end
}
