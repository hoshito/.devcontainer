return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>/c",  function() require("fzf-lua").command_history() end },
        { "<leader>/f",  function() require("fzf-lua").files() end },
        { "<leader>/b",  function() require("fzf-lua").buffers() end },
        { "<leader>/g",  function() require("fzf-lua").grep_visual() end },
        { "<leader>/o",  function() require("fzf-lua").oldfiles() end },
        { "<leader>//",  function() require("fzf-lua").resume() end },
    },
    config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup{
            winopts = { height=0.9, width=0.9 }
        }
    end
}
