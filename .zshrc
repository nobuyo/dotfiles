export LANG=ja_JP.UTF-8

HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000

# show logo and infos
#./archey

# PATH setting
PATH=/usr/local/bin:$PATH:~/bin
# export MANPATH=/usr/local/share/man:/usr/local/man:/usr/share/man

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# git nocorrect
alias git='nocorrect git'

# apt-cyg
alias apc='apt-cyg'
alias apci='apt-cyg install'
alias apcr='apt-cyg remove'

# cyg-fast
alias cyg-fast='cyg-fast -r'

# like open in cygwin
alias open='cygstart'

autoload -Uz compinit
compinit
autoload colors
colors

case ${UID} in
0)
  PROMPT="%B%{${fg[white]}%}%/#%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[white]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[white]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT="%{${fg[white]}%}%/%%%{${reset_color}%} "
  PROMPT2="%{${fg[white]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[white]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
esac


unsetopt promptcr

setopt prompt_subst

setopt nobeep

setopt long_list_jobs

setopt list_types

setopt auto_resume

setopt auto_list

setopt hist_ignore_dups

setopt autopushd

setopt pushd_ignore_dups

setopt extended_glob

setopt auto_menu

setopt extended_history

setopt equals

setopt magic_equal_subst

setopt hist_verify

setopt numeric_glob_sort

setopt print_eight_bit

setopt share_history

zstyle ':completion:*:default' menu select=1

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

setopt auto_cd

setopt auto_param_keys

setopt auto_param_slash

setopt correct

setopt auto_cd
function chpwd() { l }