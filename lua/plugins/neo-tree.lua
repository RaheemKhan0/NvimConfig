return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        -- Set keybinding for opening Neo-tree
        vim.keymap.set("n", "<leader>e", ':Neotree filesystem reveal left<CR>', {})

        -- Neo-tree configuration
        require("neo-tree").setup {
            filesystem = {
                follow_current_file = true, -- Sync with the current file
                use_libuv_file_watcher = true, -- Auto-refresh when files change externally
                hijack_netrw_behavior = "open_default", -- Optional, ensures Neo-tree replaces netrw
            },
            window = {
                mappings = {
                    ["o"] = "open",
                    ["<CR>"] = "open",
                    ["s"] = "open_split",
                    ["v"] = "open_vsplit",
                },
            },
        }

        -- Enable autoread for buffers
        vim.o.autoread = true
        vim.cmd [[
            autocmd FocusGained,BufEnter * checktime
        ]]
    end
}

