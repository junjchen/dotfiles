set nocompatible

syntax on
filetype plugin on
filetype indent on

set t_Co=256
set background=dark

set noerrorbells
set vb t_vb=

set history=100
set ruler
set cursorline
set number
set scrolloff=4

set encoding=utf-8
set termencoding=utf-8
set autoread
set lazyredraw
set hidden

set re=1

set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set shiftwidth=2
set shiftround

set autoindent
set copyindent
set smartindent

set hlsearch
set incsearch
set ignorecase
set showmatch
set matchtime=2

set backspace=eol,start,indent
set textwidth=500
set linebreak
set wrap
set whichwrap+=<,>,h,l

set fileformats=unix,dos,mac
set nobackup
set nowritebackup
set noswapfile

set wildmenu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set laststatus=2
set showcmd

set shell=/bin/bash\ --login
set shellcmdflag=-c

set tags=./tags;

let mapleader = ","

map $ <nop>
map ^ <nop>
map { <nop>
map } <nop>

noremap K {
noremap J }
noremap H ^
noremap L $

map <c-j> <c-W>j
map <c-k> <c-W>k
map <c-h> <c-W>h
map <c-l> <c-W>l

map <leader>w :w!<cr>
map <silent> <leader><cr> :noh<cr>
nnoremap <leader><leader> :b#<cr>
nnoremap <leader>t :tabnext<cr>
nnoremap <leader>x :q<cr>
nnoremap <leader>v :vsp<cr>
nnoremap <leader>h :sp<cr>
nnoremap <space> /
nnoremap Y y$
command W w !sudo tee % > /dev/null

function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
end

call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'mileszs/ack.vim'
  Plug 'dense-analysis/ale'
  Plug 'vim-airline/vim-airline'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'morhetz/gruvbox'
  Plug 'tpope/vim-rails'
  Plug 'flowtype/vim-flow'
  Plug 'ervandew/supertab'
  Plug 'vim-scripts/mru.vim'
  Plug 'yuezk/vim-js'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'ocaml/vim-ocaml'
call plug#end()

" CtrlP
let g:ctrlp_map="<c-p>"
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" NERDTree
map <leader>n :NERDTreeToggle<cr>
map <leader>f :NERDTreeFind<cr>
let NERDTreeShowHidden = 1

" Ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <c-f> :Ack!<space>
vnoremap <c-f> y:Ack! <c-r>=fnameescape(@")<cr><cr>

" Ale
let g:ale_fixers = { 'javascript': ['prettier'], 'typescript': ['prettier'], 'typescriptreact': ['prettier']}
let g:ale_linters = { 'javascript': ['eslint', 'flow', 'flow-language-server'], 'java': [] }
let g:ale_fix_on_save = 1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = 'dark'

" Gruvbox
colorscheme gruvbox

" Supertab
let g:SuperTabDefaultCompletionType = 'context'

" MRU.vim
map <leader>m :MRU<cr>
