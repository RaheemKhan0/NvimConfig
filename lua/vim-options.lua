vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.keymap.set('v', 'i', ":'<,'> norm I   ", { noremap = true, silent = true })
vim.keymap.set('n', '<Leader><Left>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader><Down>', '<C-w>j', {noremap = true, silent = true})
vim.keymap.set('n', '<Leader><Up>', '<C-w>k', {noremap = true , silent = true})
vim.keymap.set('n', '<Leader><Right>', '<C-w>l', {noremap = true , silent = true})
vim.opt.number = true       -- Shows absolute line numbers
vim.opt.relativenumber = false -- Shows relative line numbers
-- Set a white cursor for all modes
vim.cmd [[
  highlight Cursor guifg=white guibg=black
]]

-- Ensure the cursor remains consistent across all modes
vim.o.guicursor = 'n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr:hor20-Cursor,o:hor50-Cursor'
