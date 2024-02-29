return {
  'numToStr/Comment.nvim',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    opts = { enable_autocmd = false }
  },
  event = 'VeryLazy',
  --lazy = false,
  config = function()
    require('Comment').setup {
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      mappings = { basic = false, extra = false }
    }

    vim.keymap.set('n', '++', '<Plug>(comment_toggle_linewise_current)', { desc = 'Toggle line comment' })
    vim.keymap.set('v', '++', '<Plug>(comment_toggle_linewise_visual)', { desc = 'Toggle line comment' })

    vim.keymap.set('n', '??', '<Plug>(comment_toggle_blockwise_current)', { desc = 'Toggle block comment' })
    vim.keymap.set('v', '??', '<Plug>(comment_toggle_blockwise_visual)', { desc = 'Toggle block comment' })
  end
}
