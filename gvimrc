colorscheme murphy
set columns=80
set lines=55

let localconfig = $HOME . "/.gvimrc.local"
if filereadable(localconfig)
    exec ":source " . localconfig
endif
