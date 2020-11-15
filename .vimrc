" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Plug begin
call plug#begin('~/.vim/plugged')

" THEME: nord theme
Plug 'arcticicestudio/nord-vim'

" AIRLINE: lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" COC: Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Turn on syntax highlighting
syntax on

" Setup nord theme
let g:nord_underline = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1

" Setup airline
let g:airline_theme = 'nord'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

" Activate theme
colorscheme nord

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

" Remap keys for COC
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

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
