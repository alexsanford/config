
export EDITOR=vin
export PAGER=less
export PATH=$PATH:$HOME/bin

# OS Specific and local env files
if [[ `uname` = 'Darwin' ]]
then
    [[ -s $HOME/.zshenv.osx ]] && source $HOME/.zshenv.osx
elif [[ `uname` = 'Linux' ]]
then
    [[ -s $HOME/.zshenv.linux ]] && source $HOME/.zshenv.linux
fi
[[ -s $HOME/.zshenv.local ]] && source $HOME/.zshenv.local
