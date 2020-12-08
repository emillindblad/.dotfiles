"            _
" _ ____   _(_)_ __ ___
"| '_ \ \ / / | '_ ` _ \
"| | | \ V /| | | | | | |
"|_| |_|\_/ |_|_| |_| |_|

let mapleader =","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/

	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'jiangmiao/auto-pairs'
Plug 'sirver/ultisnips'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'slim-template/vim-slim'
Plug 'vim-ruby/vim-ruby'
call plug#end()

" Vimtex settings
    let g:vimtex_complier_progname = 'nvr'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
    let g:vimtex_complete_enabled=1
    let g:vimtex_complete_close_braces=1

" UltiSnips
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

" deoplete
    call deoplete#custom#var('omni', 'input_patterns', {
        \ 'tex': g:vimtex#re#deoplete
        \})
    let g:deoplete#enable_at_startup = 1

" lightline
    let g:lightline = {
          \ 'colorscheme': 'wombat',
          \ }

" Some basics
    filetype plugin indent on
    set tabstop=4
    set nocompatible
    set shiftwidth=4
    set expandtab
    set encoding=utf-8
    set number relativenumber
    set pastetoggle=<F3>
    syntax enable
    syntax on
    let g:livepreview_previewer = 'zathura'
    setlocal spell
    set spelllang=sv,en_us
    set noshowmode

" Theme and colors
    set termguicolors
    colorscheme nord
    hi Normal guibg=NONE ctermbg=NONE
    hi NonText ctermbg=NONE
    hi NonText guibg=NONE
    highlight clear SignColumn
    augroup nord-theme-overrides
        autocmd!
        " Use 'nord7' as foreground color for Vim comment titles.
        autocmd ColorScheme nord highlight vimCommentTitle ctermfg=14 guifg=#8FBCBB
    augroup END
    let g:nord_cursor_line_number_background = 1
    let g:nord_italic_comments = 1
    "if &term =~ '256color'
        " disable Background Color Erase (BCE) so that color schemes
        " render properly when inside 256-color tmux and GNU screen.
        " see also http://sunaku.github.io/vim-256color-bce.html
        "set t_ut=
    "endif

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"---Keybindings---

" NERDtree
    nmap <C-n> :NERDTreeToggle<CR>

" NERDcomment
    vmap ++ <plug>NERDCommenterToggle
    nmap ++ <plug>NERDCommenterToggle

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Navigating with guides
	inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	map <leader><leader> <Esc>/<++><Enter>"_c4l

"Tab visual selection
    "vnoremap <Tab> >gv
    "vnoremap <S-tab> <gv

