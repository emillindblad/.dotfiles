"            _
" _ ____   _(_)_ __ ___
"| '_ \ \ / / | '_ ` _ \
"| | | \ V /| | | | | | |
"|_| |_|\_/ |_|_| |_| |_|


" TODO
" Migrate to lua
" Migrate lazy
" Plugin stuff in /after/plugin, others things can also be in /after

let mapleader = " "

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
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
Plug 'williamboman/mason-lspconfig.nvim'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'onsails/lspkind.nvim'
Plug 'folke/neodev.nvim'

" Snip snip
Plug 'sirver/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
Plug 'nvim-telescope/telescope-media-files.nvim'

" Statusline and Lsp status
Plug 'nvim-lualine/lualine.nvim'
Plug 'j-hui/fidget.nvim', { 'tag': 'legacy' }

" The best colors
Plug 'ellisonleao/gruvbox.nvim'

" Plugins for specific files
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'lervag/vimtex'
Plug 'roobert/tailwindcss-colorizer-cmp.nvim'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Comments
Plug 'scrooloose/nerdcommenter'

" Future plugins to checkout
"Plug 'numToStr/Comment.nvim'
"Plug 'JoosepAlviste/nvim-ts-context-commentstring'
"Plug 'folke/todo-comments.nvim'

Plug 'windwp/nvim-autopairs'

Plug 'tpope/vim-dispatch'
Plug 'mbbill/undotree'

" Lets try it
Plug 'github/copilot.vim'

call plug#end()

lua require("luaconfigs")

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
    nnoremap <C-n> :Vexplore><CR>

" NERDcomment
    vnoremap ++ <plug>NERDCommenterToggle
    nnoremap ++ <plug>NERDCommenterToggle

" Tab visual selection
    vnoremap > >gv
    vnoremap < <gv

" Quickfix window
    nnoremap <leader>q :cclose<CR>
    nnoremap <C-j> :cnext<CR>zz
    nnoremap <C-k> :cprev<CR>zz

    nnoremap <F8> <nop>

" Compile and run with c and c++
    au FileType c nnoremap <F8> :w<CR>:!gcc % -o %< && ./%< <CR>
    au FileType cpp nnoremap <F8> :w<CR>:!g++ -o %< % && ./%< <CR>
