" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Loading plugins
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" AIRLINE: lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" GRUVBOX: Retro groove color scheme for Vim
Plugin 'morhetz/gruvbox'

" AIRLINE CONFIG: airline color scheme & options
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1

" YCM: a code-completion engine for Vim
" Plugin 'ycm-core/YouCompleteMe'

" YCM CONFIG: 
" enable previewpoput
" set previewpopup=height:10,width:60,highlight:PMenuSbar
" set completeopt+=popup
" set completepopup=height:15,width:60,border:off,highlight:PMenuSbar
" let g:ycm_add_preview_to_completeopt = 1

call vundle#end()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

let mapleader = " "

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

set backupskip=/tmp/*,/private/tmp/*

" Clipboard
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed " OSX
else
  set clipboard=unnamedplus " Linux
endif

" Security
set modeline
set modelines=0

" Show relative line numbers
set number relativenumber
set nu rnu

" Show file stats
set ruler

" Show the filename in the window titlebar
set title

" Blink cursor on error instead of beeping (grr)
" set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set mouse=a
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Timeouts
set timeoutlen=1000 ttimeoutlen=0

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
" inoremap <F1> <ESC>:set invfullscreen<CR>a
" nnoremap <F1> :set invfullscreen<CR>
" vnoremap <F1> :set invfullscreen<CR>

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
highlight Comment cterm=italic
let g:gruvbox_italic=1
colorscheme gruvbox
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
