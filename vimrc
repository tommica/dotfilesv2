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
set shell=zsh
filetype plugin on

set backspace=indent,eol,start

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

let mapleader=','

set hidden
set noshowmode

set hlsearch
set incsearch
set ignorecase
set smartcase
set smartindent

set clipboard=unnamed " use os clipboard



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
set rnu nu
set so=999

set mousemodel=popup
set t_Co=256
set cursorline
set number

set showmatch " highlight matching [{()}]
set incsearch " search as characters are entered

"" 1) Plugins
" Install them with :PlugInstall
" Make sure you use single quotes
call plug#begin('~/.vim/plugged')

" Theme
Plug 'jonathanfilip/vim-lucius'

" Trailing whitespace management (:FixWhitespace)
Plug 'bronson/vim-trailing-whitespace'

" HTML bundle
Plug 'Raimondi/delimitMate'
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'
Plug 'vimwiki/vimwiki'

" Syntax check
Plug 'https://github.com/scrooloose/syntastic'

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Buffers
Plug 'bling/vim-bufferline'

" Undo
Plug 'sjl/gundo.vim'

" ag
Plug 'rking/ag.vim'

" Nerdtree
Plug 'https://github.com/scrooloose/nerdtree'

" Git tools
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Ctrlp
Plug 'kien/ctrlp.vim'

" Wordpress.vim
Plug 'https://github.com/dsawardekar/wordpress.vim'

" Autocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

call plug#end()

"" 2) Theme & Visual settings

" Set theme
set background=dark
try
    colorscheme lucius
	LuciusDarkHighContrast
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
let g:airline#extensions#tabline#enabled = 0 
let g:airline#extensions#branch#enabled = 1 
let g:airline_left_sep = ' ❤  '
let g:airline_right_sep = ' 🟆  '
let g:airline_section_warning = '' 
let g:airline_section_y = '' 
let g:airline_section_x = '' 

set guifont=Fira\ Code:h20

" 3) File management & editing

" Ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/* " lol
let g:ctrlp_show_hidden=1

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

" Nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " autoquit if only nerdtree is open

" Nerd Tree toggling
map <C-b> :NERDTreeToggle<CR>

" File type stuff
autocmd FileType javascript JsPreTmpl html
let g:jsx_ext_required = 0

" move between buffers
map <C-Left> <Esc>:bprev<CR>
map <C-Right> <Esc>:bnext<CR>

" switch to left / right split (mostly for Nerd Tree)
map <C-h> <C-W>h
map <C-l> <C-W>l