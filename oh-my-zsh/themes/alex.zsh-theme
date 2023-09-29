
function precmd()
{
    HOST='%{$fg[cyan]%}$(whoami)@$(hostname -s)%{$reset_color%}'
    DIR='%{$fg[red]%}%~%{$reset_color%}'
    RVM='%{$fg[yellow]%}$(rvm current)%{$reset_color%}'
    DATE=' {%{$fg[green]%}'`date +%H:%M:%S`'%{$reset_color%}}'

    # Git prompt
    if git rev-parse --is-inside-work-tree &>/dev/null
    then
        if [[ $OMZ_NOGIT != 1 ]]
        then
            git_prompt=$(git_prompt_info)
        else
            git_prompt="git:prompt-disabled"
        fi

        GIT=' %{$reset_color%}[%{$fg[yellow]%}${git_prompt}%{$reset_color%}]'
    else
        GIT=''
    fi

    # Tor prompt
    if which torsocks >/dev/null && torsocks show | grep libtorsocks.so >/dev/null
    then
        if [[ -n $TORSOCKS_ISOLATE_PID ]]
        then
            tor_prompt='TOR (isolated)'
        elif [[ -n $TORSOCKS_USERNAME ]] && [[ -n $TORSOCKS_PASSWORD ]]
        then
            tor_prompt="TOR (user:$TORSOCKS_USERNAME)"
        else
            tor_prompt='TOR'
        fi

        TOR=' %{$reset_color%}[%{$fg[magenta]%}${tor_prompt}%{$reset_color%}]'
    else
        TOR=''
    fi

    PROMPT="
$HOST:$DIR$GIT$TOR$DATE
%# "
}

ZSH_THEME_GIT_PROMPT_PREFIX="git:"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
