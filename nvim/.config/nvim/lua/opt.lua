-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Set tab to equal 4 spaces
--[[
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
]]

vim.opt.expandtab = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

vim.opt.wrap = false

vim.opt.hlsearch = false

-- Enable break indent
--vim.opt.breakindent = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 40
--vim.opt.timeoutlen = 300

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Put long lines on a new line. Useful for text documents
vim.opt.wrapmargin = 5

-- Disable swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false

-- Enable undofile
vim.opt.undofile = true

-- Enable spell check for swedish and english
vim.opt.spell = true
vim.opt.spelllang = 'en_us,sv'

-- Configure how new splits should be opened
vim.opt.splitright = true

-- Sets how to display certain whitespace in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd({ 'BufWritePre', 'BufWrite' }, {
  pattern = '*',
  command = [[ %s/\s\+$//e ]],
})

-- Highlight text on yank
vim.api.nvim_create_autocmd('textyankpost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.highlight.on_yank()
  end,
})
