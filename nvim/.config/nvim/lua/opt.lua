-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Set tab to equal 4 spaces
--[[
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
]]

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

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 40
--vim.opt.timeoutlen = 300

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Put long lines on a new line. Useful for text documents
vim.opt.wrapmargin = 5

vim.opt.swapfile = false                                -- Disable swap files
vim.opt.backup = false                                  -- Disable backup files
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"  -- Set undodir
vim.opt.undofile = true                                 -- Enable undo files

vim.opt.spell = true                                    -- Enable spell check
vim.opt.spelllang = "sv,en_us"                          -- Set spell check to sv and eng

-- Configure how new splits should be opened
vim.opt.splitright = true

-- Sets how neovim will display certain whitespace in the editor.
--  See :help 'list'
--  and :help 'listchars'
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern =  '*',
  callback = function()
    vim.notify("Cleared whitespace")
    vim.cmd([[
       %s/\s\\'+'$//e
       ]])
  end
})

vim.api.nvim_create_autocmd('textyankpost', {
  desc = 'highlight when yanking (copying) text',
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.cmd([[
    autocmd BufWritePre * %s/\s\+$//e
]])
