--[[
 _ __  __   __  _   _ __ ___
| '_ \ \ \ / / | | | '_ ` _ \
| | | | \ V /  | | | | | | | |
|_| |_|  \_/   |_| |_| |_| |_|

]]

-- Set leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Load options and remaps
require('opt')
require('remap')

-- Install Lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- Load and configure plugins
require('lazy').setup (
  'plugins',
  {
    ui = { border = 'rounded' },
    change_detection = { notify = false }
  }
)
