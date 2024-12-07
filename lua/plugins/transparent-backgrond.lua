return {
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup({
        -- Default groups
        groups = {
          'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
          'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
          'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
          'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
          'EndOfBuffer',
        },
        -- Additional groups for specific plugins
        extra_groups = {
          "NormalFloat",        -- Plugins with floating panels like Mason, Lazy
          "NvimTreeNormal",     -- NvimTree panel
          "NvimTreeNormalNC",   -- Non-current NvimTree panel (if applicable)
        },
        exclude_groups = {},    -- Groups not to clear
      })

      -- Explicitly clear background highlights (if needed)
      vim.cmd([[highlight NvimTreeNormal guibg=NONE ctermbg=NONE]])
      vim.cmd([[highlight NvimTreeNormalNC guibg=NONE ctermbg=NONE]])
    end
  }
}



