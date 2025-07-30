local set = vim.opt_local

-- Insert spaces instead of tabs
set.expandtab = true
set.shiftwidth = 4
set.tabstop = 4

-- Replace tabs with 4 spaces after using `gopls format`
vim.api.nvim_create_autocmd('BufWritePre', {
  buffer = 0,
  callback = function()
    local view = vim.fn.winsaveview() -- Save cursor position
    vim.cmd([[%s/\t/    /ge]])
    vim.fn.winrestview(view)
  end,
})
