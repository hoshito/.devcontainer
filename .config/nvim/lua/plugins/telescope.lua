return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local telescope = require('telescope')
            local actions = require('telescope.actions')

            telescope.setup {
                defaults = {
                    initial_mode = "normal",
                    pickers = {
                        find_files = {
                            hidden = true
                        },
                    },
                    -- vimgrep_arguments = {
                    --     'rg',
                    --     '--color=never',
                    --     '--no-heading',
                    --     '--with-filename',
                    --     '--line-number',
                    --     '--column',
                    --     '--smart-case',
                    --     '--hidden',
                    -- },
                    path_display = {
                        filename_first = {
                            reverse_directories = false,
                        },
                    },
                    sorting_strategy = "ascending",
                    layout_config = {
                        horizontal = {
                            prompt_position = 'top',
                            preview_width = 0.6,
                        },
                        width = {
                            padding = 1
                        },
                        height = {
                            padding = 1
                        }
                    },
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                    },
                },
            }
            -- キーマッピングの設定
            local builtin = require('telescope.builtin')
            -- vim.keymap.set('n', '<leader>ff', "<cmd>:Telescope find_files find_command=rg,--files,--hidden,--glob,!*.git <CR>", {})
            vim.keymap.set('n', '<leader>f~', "<cmd>:Telescope find_files cwd=~<CR>", {})
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end
    },
    {
        "danielfalk/smart-open.nvim",
        branch = "0.2.x",
        config = function()
            require("telescope").load_extension("smart_open")
            vim.keymap.set("n", "<leader><leader>", function()
                require("telescope").extensions.smart_open.smart_open()
            end, { noremap = true, silent = true })
        end,
        dependencies = {
            "kkharji/sqlite.lua",
            -- Only required if using match_algorithm fzf
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
            -- { "nvim-telescope/telescope-fzy-native.nvim" },
        },
    }
}
