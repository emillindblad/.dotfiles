"            _
" _ ____   _(_)_ __ ___
"| '_ \ \ / / | '_ ` _ \
"| | | \ V /| | | | | | |
"|_| |_|\_/ |_|_| |_| |_|

" Set leader key
let mapleader = " "

" Autodownload vim-plug if not installed
if ! filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
    echo "Downloading vim-plug to manage plugins..."
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" Define plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'

Plug 'lervag/vimtex'

Plug 'jiangmiao/auto-pairs'


Plug 'tpope/vim-fugitive'

Plug 'gruvbox-community/gruvbox'

Plug 'itchyny/lightline.vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" LSP
Plug 'neovim/nvim-lspconfig'

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" Snip snip
Plug 'sirver/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
call plug#end()

"------------ LSP configs ---------------
" Everything in here will be interpreted as lua
lua << EOF

-------------------Completion------------

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            -- For `vsnip` user.
            -- vim.fn["vsnip#anonymous"](args.body)

            -- For `luasnip` user.
            -- require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` user.
             vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = {
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },

    sources = {
        { name = 'nvim_lsp' },
        -- For ultisnips user.
        { name = 'ultisnips' },
        { name = 'buffer' },
    }
})

-------------------LSP servers------------------

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
    })

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }, _config or {})
end

--Python
require('lspconfig').jedi_language_server.setup(config())

--LaTeX
require('lspconfig').texlab.setup(config())

-- C/C++
require'lspconfig'.clangd.setup(config({
    cmd = { "clangd", "--background-index", "--clang-tidy" },
    root_dir = function() return vim.loop.cwd() end
}))

--Javuh
require'lspconfig'.java_language_server.setup(config({
    cmd = {"/home/emil/github/etc/java-language-server/dist/lang_server_linux.sh"}
}))

--SQL
require'lspconfig'.sqlls.setup(config())


-------------------Telescope-------------
require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " >",
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
})


require("telescope").load_extension("fzy_native")

--Tree sitter
require'nvim-treesitter.configs'.setup { indent = { enable = true }, highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

EOF
"End of Lua block

set completeopt=menu,menuone,noselect

" LSP bindings
nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader><CR> :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>sd :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>vll :call LspLocationList()<CR>

" Telescope
nnoremap <C-p> :lua require("telescope.builtin").git_files()<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>

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

" lightline
    let g:lightline = {
          \ 'colorscheme': 'wombat',
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
          \ },
          \ 'component_function': {
          \   'gitbranch': 'FugitiveHead'
          \ },
          \ }
" NERDtree
    let NERDTreeShowHidden=1

    let g:livepreview_previewer = 'zathura'


    filetype plugin indent on

    set tabstop=4 softtabstop=4     "Set tab to equal 4 spaces
    set shiftwidth=4                "Set spaces for auto indent
    set expandtab                   "Use spaces instead of tabs
    set smartindent                 "Auto indentation
    set scrolloff=8                 "Window start scrolling when 8 row from bottom/top
    set nocompatible
    set encoding=utf-8              "Encoding
    set number relativenumber       "Line numbers are shown relative to current line
    set pastetoggle=<F3>            "Toggle past mode
    setlocal spell                  "Enable spell check
    set spelllang=sv,en_us          "Set spell check to sv and eng
    set noshowmode                  "Dont show current mode (Shown by lightline instead)
    set nowrap                      "Text wont wrap
    set nohlsearch                  "Turn off highlight for search
    set incsearch                   "Incremental search
    set hidden                      "Keep unsaved buffers open
    set signcolumn=yes              "Dat LSP column
    set ignorecase                  "Better search
    set smartcase                   "Being able to choose case sensitivity in searches

    syntax enable
    syntax on

" Theme and colors
    colorscheme gruvbox

    let g:gruvbox_contrast_dark = 'hard'
    let g:gruvbox_invert_selection='0'
    set termguicolors
    set background=dark

    highlight ColorColumn ctermbg=0 guibg=grey
    hi SignColumn guibg=none
    hi CursorLineNR guibg=None
    highlight Normal guibg=none
    "highlight LineNr guifg=#ff8659
    "highlight LineNr guifg=#aed75f
    highlight LineNr guifg=#5eacd3
    highlight netrwDir guifg=#5eacd3
    highlight qfFileName guifg=#aed75f
    hi TelescopeBorder guifg=#5eacd

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
    nmap <C-n> :NERDTreeToggle<CR>

" NERDcomment
    vmap ++ <plug>NERDCommenterToggle
    nmap ++ <plug>NERDCommenterToggle

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

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

" Complie and view LaTeX with VimTeX
    au FileType tex nnoremap <F8> :VimtexCompile<CR>

" View markdown with MarkdownPreview
    au FileType markdown nnoremap <F8> :MarkdownPreview<CR>
