nnoremap <C-p> :lua require("telescope.builtin").git_files()<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>pw :lua require('telescope.builtin').live_grep { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files({ hidden = true, no_ignore = true })<CR>
nnoremap <leader>vrc :lua require('luaconfigs.telescope').search_dotfiles({ hidden = true })<CR>
nnoremap <leader>dl :Telescope diagnostics<CR>
