return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      exclude = {
        filetypes = { "dashboard", "NvimTree", "startify", "alpha" }, -- Add any filetypes to exclude
        buftypes = { "nofile", "terminal" }, -- Exclude non-file buffers like terminal
      },
    },
    config = function()
      require("ibl").setup({
        exclude = {
          filetypes = { "dashboard", "NvimTree", "startify", "alpha" },
          buftypes = { "nofile", "terminal" },
        },
      })
    end,
  },
}

