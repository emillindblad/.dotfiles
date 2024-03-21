vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"+y$', { desc = 'Yank til end of line to clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>pp', '"+p', { desc = 'Put from clipboard' })

vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Keep cursor centered when searching' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Keep cursor centered when searching' })

vim.keymap.set('v', '>', '>gv', { desc = 'Move visual selection right' })
vim.keymap.set('v', '<', '<gv', { desc = 'Move visual selection left' })

vim.keymap.set('n', '<leader>q', '<cmd>cclose<CR>', { desc = 'Close Quickfix window' })
vim.keymap.set('n', '<C-j>', '<cmd>cnext<CR>zz', { desc = 'Next item in Quickfix window' })
vim.keymap.set('n', '<C-k>', '<cmd>cprev<CR>zz', { desc = 'Previous item in Quickfix window' })

vim.keymap.set('n', '<leader>pv', '<cmd>Ex<CR>', { desc = 'Open netrw' })

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Find and replace' })

vim.keymap.set('n', '<leader>ls', function()
  require('luasnip.loaders.from_lua').lazy_load { paths = { vim.fn.stdpath('config') .. '/LuaSnip' } }
end, { desc = '[L]oad [S]nippets' })
