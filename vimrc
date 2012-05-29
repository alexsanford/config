let mapleader=","

set expandtab
set tabstop=4
set smarttab
set shiftwidth=4
set backup
set wildmode=list:longest,full

syntax enable
set background=dark

set incsearch
set ignorecase
set linebreak

set scrolloff=3

set mouse=a

if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

au BufWinEnter *.txt,*.tex set spell

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


inoremap {
inoremap /**
inoremap /*
iab jmain public static void main(String[] args)<CR>{o}<Up>A

set directory=~/tmp/.vim
set backupdir=~/tmp/.vim

set completeopt=menuone,preview,longest
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

filetype plugin indent on
syntax on

com W w
com Q q
set ruler

runtime macros/matchit.vim
set nocompatible
if has("autocmd")
    filetype indent plugin on
endif

cabbrev git Git

nmap gk :Gitv --all<cr>
nmap gK :Gitv! --all<cr>

map \ O