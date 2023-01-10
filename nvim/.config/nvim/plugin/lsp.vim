nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>re :lua vim.lsp.buf.references()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader><CR> :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>ds :lua vim.diagnostic.open_float()<CR>
nnoremap <leader>dn :lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>vll :call LspLocationList()<CR>
