return {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    event = "InsertEnter",
    postinstall = "make install_jsregexp",
    config = function()
        local luasnip = require("luasnip")
        luasnip.config.setup({
            history = true,
            updateevents = "TextChanged,TextChangedI",
            enable_autosnippets = true,
        })
        -- add vscode exported completions
        require("luasnip.loaders.from_vscode").lazy_load()
    end,
}
