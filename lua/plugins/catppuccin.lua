return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "storm", -- Options: night, storm, day, moon
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
}


