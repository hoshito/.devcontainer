return {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
        require("oil").setup({
            view_options = {
                show_hidden = true,
            },
            float = {
                padding = 2,
                preview_split = "right",
            },
        })
        vim.keymap.set("n", "<leader>d", "<CMD>Oil --float .<CR>", { desc = "Open parent directory" })
    end
}
