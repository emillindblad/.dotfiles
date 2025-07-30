return {
  'iamcco/markdown-preview.nvim',
  dependencies = { 'tpope/vim-dispatch', lazy = true },
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  event = { 'BufEnter *.texscratch' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  config = function()
    vim.keymap.set('n', '<F8>', '<cmd>MarkdownPreview<cr>', { desc = 'Preview markdown', buffer = 0 })

    -- Change title depending on filename
    if string.match(vim.fn.expand('%:t'), '%.texscratch$') then
      vim.g.mkdp_page_title = '「LaTeX scratch{name}」'
      vim.g.mkdp_filetypes = { 'markdown', 'tex' }
    end

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
