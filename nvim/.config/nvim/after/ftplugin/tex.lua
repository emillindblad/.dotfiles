local set = vim.opt_local
set.exrc = true

vim.keymap.set('n', '<F8>', vim.fn['vimtex#compiler#compile'], { desc = 'Compile LaTeX document', buffer = 0 })
