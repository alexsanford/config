colorscheme murphy
set columns=80

let localconfig = $HOME . "/.gvimrc.local"
if filereadable(localconfig)
    exec ":source " . localconfig
endif
