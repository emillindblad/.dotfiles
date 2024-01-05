" View markdown with MarkdownPreview
au FileType markdown nnoremap <buffer> <F8> :MarkdownPreview<CR>

function! g:Open_browser(url)
    exec "Start! firefox --new-window " . a:url
    "Alternatively, without vim-dispatch
    "silent exec "firefox --new-window " . a:url . " &"
endfunction
let g:mkdp_browserfunc = 'g:Open_browser'
let g:mkdp_auto_close = 0
