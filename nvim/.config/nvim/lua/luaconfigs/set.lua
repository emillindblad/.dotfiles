vim.opt.swapfile = false                                -- Disable swap files
vim.opt.backup = false                                  -- Disable backup files
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"  -- Set undodir
vim.opt.undofile = true                                 -- Enable undo files
vim.opt.spell = true                                    -- Enable spell check
vim.opt.spelllang = "sv,en_us"                          -- Set spell check to sv and eng
