let mapleader=","

set expandtab
set tabstop=2
set smarttab
set shiftwidth=2
set backup

set wildmenu
set wildmode=list:longest,full

" Get out of the menu by using the \ key
" Put in a literal \ with <Ctrl-V>\
cmap \ \<BS>

syntax enable

set incsearch
set ignorecase
set linebreak

set scrolloff=3

set mouse=nicr

" Custom colorscheme
colorscheme murphy

if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Trailing whitespace
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\s\+$', -1)

au BufWinEnter *.txt,*.tex,*.otl set spell

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set virtualedit=all

set directory=~/tmp/.vim
set backupdir=~/tmp/.vim

set completeopt=menuone,preview,longest
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

filetype plugin indent on
syntax on

com! W w
com! Q q
com! Wq wq
com! WQ wq

set ruler

runtime macros/matchit.vim
set nocompatible
if has("autocmd")
    filetype indent plugin on
endif

cabbrev git Git

" Remove these mappings for now. gk is useful for long lines
" nmap gk :Gitv --all<cr>
" nmap gK :Gitv! --all<cr>

map \ O<Enter>
map gi gg=G''
nmap <Space> ^
nmap <Enter> $

" Run latest command in 'test' tmux session
map TT :!tmux send-keys -t test Up Enter<Enter><Enter>

" AutoPairs Plugin
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert="<C-b>"
let g:AutoPairsFlyModeOnlyCurrentLine = 1

" Fuzzy matching
map ff :FufFile
map fF :FufFileWithCurrentBufferDir
map fl :FufLine
map fb :FufBuffer

" NERDTree Plugin
map  :NERDTreeToggle<CR>
imap  <Esc>:NERDTreeToggle<CR>
let NERDChristmasTree=1
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1

" Filetype settings
autocmd FileType html setlocal shiftwidth=2 tabstop=2
