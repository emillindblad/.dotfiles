"            _
" _ ____   _(_)_ __ ___
"| '_ \ \ / / | '_ ` _ \
"| | | \ V /| | | | | | |
"|_| |_|\_/ |_|_| |_| |_|


" Autodownload vim-plug if not installed
if ! filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
    echo "Downloading vim-plug to manage plugins..."
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" Define plugins
call plug#begin(stdpath('data') . '/plugged')
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-context'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

" Snip snip
Plug 'sirver/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'lervag/vimtex'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
"Plug 'gruvbox-community/gruvbox'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'itchyny/lightline.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'tpope/vim-dispatch'

call plug#end()

let mapleader = " "

lua require("luaconfigs")

" NERDtree
    let NERDTreeShowHidden=1

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Explore
    nnoremap <leader>pv :Ex<CR>

" Find and replace
    nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Yeet Ex mode out of here
    nnoremap <silent> Q <nop>

" Behave Vim
    nnoremap Y y$

" Yank to the clipboard
    nnoremap <leader>y "+y
    vnoremap <leader>y "+y

    nnoremap <leader>Y "+y$
    vnoremap <leader>Y "+y$

" Keeping it centered
    nnoremap n nzzzv
    nnoremap N Nzzzv

" NERDtree
    nnoremap <C-n> :NERDTreeToggle<CR>

" NERDcomment
    vnoremap ++ <plug>NERDCommenterToggle
    nnoremap ++ <plug>NERDCommenterToggle

" Tab visual selection
    vnoremap > >gv
    vnoremap < <gv

" Tabs and spit
    nnoremap <C-t> :tabnew<CR>
    nnoremap <leader>n :tabn<CR>
    nnoremap <leader>p :tabp<CR>

" Compile and run with c and c++
    au FileType c nnoremap <F8> :w<CR>:!gcc % -o %< && ./%< <CR>
    au FileType cpp nnoremap <F8> :w<CR>:!g++ -o %< % && ./%< <CR>


" View markdown with MarkdownPreview
    au FileType markdown nnoremap <F8> :MarkdownPreview<CR>

    function! g:Open_browser(url)
        exec "Start! firefox --new-window " . a:url
        " Alternatively, without vim-dispatch
        "silent exec "firefox --new-window " . a:url . " &"
    endfunction
    let g:mkdp_browserfunc = 'g:Open_browser'

" Compile and view LaTeX with VimTeX
    nnoremap <F8> <nop>
    au FileType tex nnoremap <F8> :VimtexCompile<CR>
    au FileType tex setlocal spell                          "Enable spell check
    au FileType tex set spelllang=sv,en_us                  "Set spell check to sv and eng

