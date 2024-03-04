return {
  'iamcco/markdown-preview.nvim',
  dependencies = { 'tpope/vim-dispatch', lazy = true },
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  config = function()
    vim.keymap.set('n', '<F8>', '<cmd>MarkdownPreview<cr>', { desc = 'Preview markdown', buffer = 0 })
    -- Create custom function to start preview in a new browser window
    vim.cmd([[
      function! g:Open_browser(url)
        exec "Start! firefox --new-window " . a:url
        " Alternatively, without vim-dispatch
        " silent exec "firefox --new-window " . a:url . " &"
        endfunction
      let g:mkdp_browserfunc = 'g:Open_browser'
      let g:mkdp_auto_close = 0
    ]])
  end,
}
