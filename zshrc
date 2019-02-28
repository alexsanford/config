
# Oh My ZSH Config

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

if [[ -d $ZSH ]]
then
  ZSH_THEME="alex"
  DISABLE_AUTO_TITLE="true"
  plugins=(git bundler gem heroku rails3 rvm tmux)

  [[ `uname` = 'Darwin' ]] && plugins+=osx

  source $ZSH/oh-my-zsh.sh
else
  echo 'PLEASE INSTALL OH MY ZSH (git clone git@github.com:alexsanford/oh-my-zsh ~/.oh-my-zsh)'
fi

setopt interactivecomments

# Keys
#bindkey -v "^S" push-line # (stash) push current command into buffer, then pull back

# Too annoying
unsetopt correct_all
unsetopt nomatch

# History
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search

# RVM
[[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# NVM
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

# Tmuxifier
[[ -s "$HOME/.tmuxifier/init.sh" ]] && source "$HOME/.tmuxifier/init.sh"

# Pythonbrew
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

# Aliases, OS specific config, and local config
[[ -s $HOME/.zsh_aliases ]] && source $HOME/.zsh_aliases
if [[ `uname` = 'Darwin' ]]
then
    [[ -s $HOME/.zshrc.osx ]] && source $HOME/.zshrc.osx
    [[ -s $HOME/.zsh_aliases.osx ]] && source $HOME/.zsh_aliases.osx
elif [[ `uname` = 'Linux' ]]
then
    [[ -s $HOME/.zshrc.linux ]] && source $HOME/.zshrc.linux
    [[ -s $HOME/.zsh_aliases.linux ]] && source $HOME/.zsh_aliases.linux
fi
[[ -s $HOME/.zshrc.local ]] && source $HOME/.zshrc.local
[[ -s $HOME/.zsh_aliases.local ]] && source $HOME/.zsh_aliases.local

[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# PyEnv
[[ -s /usr/local/bin/pyenv ]] && eval "$(/usr/local/bin/pyenv init -)"

# Tmuxinator completion
if [[ which tmuxinator >/dev/null ]]
then
  _tmuxinator() {
    local commands projects
    commands=(${(f)"$(tmuxinator commands zsh)"})
    projects=(${(f)"$(tmuxinator completions start)"})

    if (( CURRENT == 2 )); then
      _alternative \
        'commands:: _describe -t commands "tmuxinator subcommands" commands' \
        'projects:: _describe -t projects "tmuxinator projects" projects'
    elif (( CURRENT == 3)); then
      case $words[2] in
        copy|debug|delete|open|start)
          _arguments '*:projects:($projects)'
        ;;
      esac
    fi

    return
  }

  compdef _tmuxinator tmuxinator mux
  alias mux="tmuxinator"

  # Local Variables:
  # mode: Shell-Script
  # sh-indentation: 2
  # indent-tabs-mode: nil
  # sh-basic-offset: 2
  # End:
  # vim: ft=zsh sw=2 ts=2 et
fi
