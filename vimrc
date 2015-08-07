""""""""""""""""""""""""""""""""""""
" 0) Init
" 1) Plugins
" 2) Theme & Visual settings
" 3) File management & editing
""""""""""""""""""""""""""""""""""""

"" 0) Init
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set backspace=indent,eol,start

set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

let mapleader=','

set hidden

set hlsearch
set incsearch
set ignorecase
set smartcase

set bomb
set binary
set ttyfast

set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh

let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

syntax on
set ruler
set number

set mousemodel=popup
set t_Co=256
set nocursorline

"" 1) Plugins
" Install them with :PlugInstall
" Make sure you use single quotes
call plug#begin('~/.vim/plugged')

" Theme
Plug 'altercation/vim-colors-solarized'

" Trailing whitespace management (:FixWhitespace)
Plug 'bronson/vim-trailing-whitespace'

" HTML bundle
Plug 'amirh/HTML-AutoCloseTag'
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

" PHP Bundle
Plug 'arnaud-lb/vim-php-namespace'

" Syntax check
Plug 'https://github.com/scrooloose/syntastic'

" Buffers
Plug 'bling/vim-bufferline'

" Undo
Plug 'https://github.com/mbbill/undotree'

" ag
Plug 'rking/ag.vim'

" Git tools
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Airline
Plug 'bling/vim-airline'

" Ctrlp
Plug 'kien/ctrlp.vim'

" Phpcomplete
Plug 'shawncplus/phpcomplete.vim'

" Wordpress.vim
Plug 'https://github.com/dsawardekar/wordpress.vim'

call plug#end()

"" 2) Theme & Visual settings

" Set theme
set background=dark
try
    colorscheme solarized
catch
endtry

" Show line at the 80th column
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

" Airline
set laststatus=2
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1

" 3) File management & editing

" Ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Paste mode
set pastetoggle=<F2>

" ag
" --- type ø to search the word in all files in the current dir
nmap ø :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag

" Undo
nnoremap <F3> :UndotreeToggle<cr>
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif

" HTML5 syntax
let g:syntastic_html_tidy_exec = 'tidy5'

" Save with lead+w
noremap <Leader>w :update<CR>

" JS
let g:javascript_enable_domhtmlcss = 1
