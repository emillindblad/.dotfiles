--[[
==============================
 _ __  __   __  _   _ __ ___
| '_ \ \ \ / / | | | '_ ` _ \
| | | | \ V /  | | | | | | | |
|_| |_|  \_/   |_| |_| |_| |_|

==============================
]]

-- Set leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Load options and remaps
require('opt')
require('remap')

-- Install Lazy
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Load and configure plugins
require('lazy').setup('plugins', {
  ui = { border = 'rounded' },
  change_detection = { notify = false },
})
