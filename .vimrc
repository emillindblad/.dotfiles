set nocompatible              " be iMproved, required
filetype off                  " required
set tabstop=4


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vimtex
Plugin 'lervag/vimtex'

" vim-latex-live-preview
Plugin 'xuhdev/vim-latex-live-preview'

Plugin 'jiangmiao/auto-pairs'
Plugin 'ajh17/VimCompletesMe'
Plugin 'jschmold/sweet-dark.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:livepreview_previewer = 'zathura'

augroup VimCompletesMeTex
    autocmd!
    autocmd FileType tex
        \ let b:vcm_omni_pattern = g:vimtex#re#neocomplete
augroup END

syntax enable
" colorscheme sweet_dark
set termguicolors
" autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
