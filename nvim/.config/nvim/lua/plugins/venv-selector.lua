return {
  'linux-cultist/venv-selector.nvim',
  branch = 'regexp',
  dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim' },
  cmd = { 'VenvSelect' },

  -- event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  config = function()
    require('venv-selector').setup {
      -- Your options go here
      -- name = "venv",
      -- auto_refresh = false
    }
  end,
}
