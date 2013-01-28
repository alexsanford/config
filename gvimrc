colorscheme murphy
set columns=80
set lines=55

set mouse=a

let localconfig = $HOME . "/.gvimrc.local"
if filereadable(localconfig)
    exec ":source " . localconfig
endif

" Keybindings to use tabs like tmux windows
map <C-A>c :execute(tabpagenr("$") . "tabnew")<CR>
map <C-A>1 1gt
map <C-A>2 2gt
map <C-A>3 3gt
map <C-A>4 4gt
map <C-A>5 5gt
map <C-A>6 6gt
map <C-A>7 7gt
map <C-A>8 8gt
map <C-A>9 9gt
map <C-A>n gt
map <C-A>p gT

let g:last_tab_visited = 1
map <C-A><C-A> :execute("tabn " . g:last_tab_visited)<CR>
au! TabLeave * let g:last_tab_visited = tabpagenr()

set showtabline=2 " always show tabs in gvim, but not vim
" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel()
  if !exists('t:tab_name')
    let t:tab_name = 'vim'
  endif

  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)

  " Append the tab number
  let label .= v:lnum.':'

  " Append the tab name
  let label .= '[' . t:tab_name . ']'

  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label .= '+'
      break
    endif
  endfor

  return label
endfunction
set guitablabel=%{GuiTabLabel()}

" Change tab name
function! SetTabName(myarg)
  " Set name and refresh buffer
  let t:tab_name = a:myarg
  let &ro = &ro
endfunction
command! -nargs=1 SetTabName call SetTabName('<args>')
map <C-A>, :SetTabName<Space>
