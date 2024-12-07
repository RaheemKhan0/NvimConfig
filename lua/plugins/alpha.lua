return {
  {
    "nvimdev/dashboard-nvim",
    lazy = false, -- Dashboard shouldn't be lazy-loaded for proper stdin handling
    opts = function()
      local logo = [[
           ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
           ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
           ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
           ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
           ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
           ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          statusline = false, -- Do not hide the statusline
        },
        config = {
          header = vim.split(logo, "\n"),
          center = {
            { desc = "  Find File",       action = "Telescope find_files",  key = "f" },
            { desc = "  New File",        action = "ene | startinsert",     key = "n" },
            { desc = "  Recent Files",    action = "Telescope oldfiles",    key = "r" },
            { desc = "  Find Text",       action = "Telescope live_grep",   key = "g" },
            { desc = "  Config",          action = "e $MYVIMRC",            key = "c" },
            { desc = "  Restore Session", action = "lua require('persistence').load()", key = "s" },
            { desc = "  Lazy Extras",     action = "LazyExtras",            key = "x" },
            { desc = "󰒲  Lazy",            action = "Lazy",                  key = "l" },
            { desc = "  Quit",            action = "qa",                    key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      -- Change header color to red
      vim.cmd("highlight DashboardHeader guifg=#FF0000") -- Red color (adjust the hex value as needed)

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- Open dashboard after closing lazy
      if vim.o.filetype == "lazy" then
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = tostring(vim.api.nvim_get_current_win()),
          once = true,
          callback = function()
            vim.schedule(function()
              vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
            end)
          end,
        })
      end

      return opts
    end,
  },
}

