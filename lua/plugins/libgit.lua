return {
  'SuperBo/fugit2.nvim',
  opts = {
    width = 100,
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
    {
      'chrisgrieser/nvim-tinygit',  -- Optional for GitHub PR view
      dependencies = { 'stevearc/dressing.nvim' }
    },
  },
  cmd = { 'Fugit2', 'Fugit2Diff', 'Fugit2Graph' },  -- Lazy-load commands
  keys = {
    { '<leader>F', '<cmd>Fugit2<cr>', mode = 'n', desc = "Open Fugit2" },
    { '<leader>Fd', '<cmd>Fugit2Diff<cr>', mode = 'n', desc = "View Diff" },
    { '<leader>Fg', '<cmd>Fugit2Graph<cr>', mode = 'n', desc = "Git Graph" },
  }
}


