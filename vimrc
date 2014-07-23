""" Setup vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

call vundle#end()
filetype plugin indent on


""" My preferences

let mapleader=","

filetype plugin indent on
syntax enable

set expandtab
set tabstop=2
set shiftwidth=2
set smarttab

set wildmenu
set wildmode=list:longest,full

set incsearch
set ignorecase

set linebreak
set scrolloff=3
set virtualedit=all

set mouse=nicr
set ruler

colorscheme murphy

" Display 80th column
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Display trailing whitespace
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\s\+$', -1)

" Spellcheck text files
au BufWinEnter *.txt,*.tex,*.otl set spell

" Make moving between windows a little easier
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Some nice navigational shortcuts
map \ O<Enter>
map gi gg=G''
nmap <Space> ^
nmap <Enter> $

" Significant directories
set directory=~/tmp/.vim
set backupdir=~/tmp/.vim
set backup

set completeopt=menuone,preview,longest
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Common mistakes
com! W w
com! Q q
com! Wq wq
com! WQ wq

" Run latest command in 'test' tmux session
map TT :!tmux send-keys -t test Up Enter<Enter><Enter>


""" Plugin configuration

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
