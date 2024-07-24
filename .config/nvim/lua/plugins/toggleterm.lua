return {
    -- amongst your other plugins
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("toggleterm").setup {
                open_mapping = { [[<c-\>]], [[<c-¥>]] }
            }
            -- ターミナルのキーマッピング
            function _G.set_terminal_keymaps()
                local opts = {buffer = 0}
                vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            end

            -- ターミナル
            local terminal = require("toggleterm.terminal").Terminal:new({
                cmd = "bash",
            })
            function _terminal_toggle()
                terminal:toggle()
            end
            vim.api.nvim_set_keymap("n", "<leader>ba", "<cmd>lua _terminal_toggle()<CR>", {noremap = true, silent = true})

            -- フローティングターミナル
            local terminal_float = require("toggleterm.terminal").Terminal:new({
                cmd = "bash",
                direction = "float",
                float_opts = {
                    border = "double",
                },
            })
            function _terminal_float_toggle()
                terminal_float:toggle()
            end
            vim.api.nvim_set_keymap("n", "<leader>bf", "<cmd>lua _terminal_float_toggle()<CR>", {noremap = true, silent = true})
        end
    }
}
