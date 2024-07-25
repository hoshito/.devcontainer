return {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
        modes = {
            char = {
                enabled = false
            }
        }
    },
    -- stylua: ignore
    keys = {
        { "f", mode = { "n" }, function() require("flash").jump() end, desc = "Flash" },
    },
}
