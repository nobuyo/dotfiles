export LANG=ja_JP.UTF-8

# PATH setting
export DOTPATH=~/.dotfiles
export PROMPT_COLOR_SWITCH=0
PATH=/usr/local/bin:$PATH:~/.dotfiles/bin:~/picnic-tools/bin
# export MANPATH=/usr/local/share/man:/usr/local/man:/usr/share/man

HISTFILE=$DOTPATH/.zsh-history
HISTSIZE=100000
SAVEHIST=100000

# some more ls aliases
alias ll='ls -alF'
alias la='ls -AF'
alias l='ls -CF'

# nocorrect
alias git='nocorrect git'
alias tree='nocorrect tree'
alias hexo='nocorrect hexo'

# change prompt color
alias chprm='source chcolor'

# track yamato
alias yamato='track yamato'

# madness git
alias g='git'

# git commit message generator
alias cmt='committer'

# weather 
# alias weather='curl -s wttr.in/nagano | head -n7'

# VirtualBox aliases
alias vmup='VBoxManage startvm "CentOS6.7" --type headless'
alias vmsave='VBoxManage controlvm "CentOS6.7" savestate'
alias vmlist='VBoxManage list runningvms'

autoload -Uz compinit
compinit
autoload colors
colors

case ${OSTYPE} in
darwin*)
	. ~/.zshrc_osx
	;;
linux*)
	. ~/.zshrc_linux
	;;
*)
	. ~/.zshrc_cygwin
	;;
esac

unsetopt promptcr
unsetopt NOMATCH # or setopt NONOMATCH
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
setopt magic_equal_subst

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

setopt auto_cd
setopt auto_param_keys
setopt auto_param_slash
setopt correct

setopt auto_cd
function chpwd() { l }

function weather() {
  curl -s "wttr.in/${1:-"nagano"}" | head -n7
}