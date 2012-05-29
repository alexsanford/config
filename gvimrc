colorscheme murphy
set columns=80

let localconfig = $HOME + "/.gvimrc.local"
echo "Hi!"
echo localconfig
if filereadable(localconfig)
    echo "Hello"
    source localconfig
endif
