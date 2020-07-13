set termguicolors

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

""" Configurations
set encoding=utf-8
set number cursorline scrolloff=4
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set autoread lazyredraw
set textwidth=500 linebreak wrap whichwrap+=<,>,h,l
set hidden noswapfile nobackup nowritebackup
set updatetime=300 shortmess+=c signcolumn=yes

""" Custom Mappings
let mapleader = ","

map } <nop>
map { <nop>
map ^ <nop>
map $ <nop>

noremap J }
noremap K {
noremap H ^
noremap L $

nmap <c-j> <c-W>j
nmap <c-k> <c-W>k
nmap <c-h> <c-W>h
nmap <c-l> <c-W>l

nmap <silent> <leader><cr> :noh<cr>
nmap <leader>w :w!<cr>
nmap <leader>x :bd<cr>
nmap <leader>\ :vsp<cr>
nmap <leader>- :sp<cr>
nmap <space> /
nmap Y y$

vmap > >gv
vmap < <gv

""" Coc.nvim

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Mappings using CoCList:
nnoremap <silent> <C-p> :<C-u>CocList files<cr>
nnoremap <silent> <leader>lm :<C-u>CocList mru<cr>
nnoremap <silent> <leader>ld :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>lo :<C-u>CocList outline<cr>
nnoremap <silent> <leader>lc :<C-u>CocList commands<cr>
nnoremap <silent> <leader>ll :<C-u>CocList<cr>

" grep word under cursor
nnoremap <C-f> :<C-u>Grep<space>
vnoremap <C-f> y:<C-u>Grep<space><c-r>=fnameescape(@")<cr><cr>

command! -nargs=+ -complete=custom,s:GrepArgs Grep exe 'CocList grep '.<q-args>
function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

""" Gruvbox
autocmd vimenter * colorscheme gruvbox

""" Airline
let g:airline#extensions#coc#enabled=1
let g:airline#extensions#tabline#enabled=1

""" Coc-tsserver
" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

""" Nerdtree
map <leader>f :NERDTreeFind<CR>
let NERDTreeShowHidden = 1
