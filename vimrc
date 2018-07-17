""" Setup vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'

Plugin 'auto-pairs'
Plugin 'AutoTag'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'CSApprox'
Plugin 'digitaltoad/vim-pug'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'endwise.vim'
Plugin 'fugitive.vim'
Plugin 'JulesWang/css.vim'
Plugin 'LargeFile'
Plugin 'less.vim'
Plugin 'liquid.vim'
Plugin 'matchit.zip'
Plugin 'nginx.vim'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'pathogen.vim'
Plugin 'posva/vim-vue'
Plugin 'rails.vim'
Plugin 'ruby.vim'
Plugin 'ruby-matchit'
Plugin 'Sass'
Plugin 'slim-template/vim-slim.git'
Plugin 'SuperTab'
Plugin 'surround.vim'
Plugin 'tagbar'
Plugin 'tpope/vim-abolish'
Plugin 'mxw/vim-jsx'
Plugin 'vim-gitgutter'
Plugin 'xml.vim'
Plugin 'xmledit'
Plugin 'yaml.vim'

call vundle#end()
filetype plugin indent on

execute pathogen#infect('custom_bundle/{}')


""" My preferences

let mapleader=","

filetype plugin indent on

set tabstop=4
set shiftwidth=4

set copyindent
set preserveindent
set softtabstop=0

set list
set listchars=tab:>-,trail:~
au VimEnter * hi SpecialKey ctermfg=238 guifg=#444444

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
" TODO: figure out a way to use my version
" let g:AutoPairsFlyModeOnlyCurrentLine = 1

" HTML indentation
let g:html_indent_inctags = "html,body,head,tbody"

" JSX indentation
let g:jsx_ext_required = 0

" JSON syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" Case-preserving replace
map S Subvert

syntax off
syntax on

" OSX clipboard fix
set clipboard=unnamed

" Mouse fix for wide terminals
set ttymouse=sgr

" Tagbar
:nnoremap <silent> <Leader>b :TagbarToggle<CR><CR>
