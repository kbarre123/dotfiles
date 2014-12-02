# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin
source ~/.rvm/scripts/rvm

# Git prompt shows current branch of working tree
source ~/.git-prompt.sh

# Prompt
export PS1='\u@\h \W$(__git_ps1 " (%s)")\n$ '

# Add Android Studio
export PATH=$PATH:~/Documents/code/android/android-studio/bin

# Amazon Web Services CLI tools
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre

# Set for Zachary Review Rails app
export OWNER_EMAIL="info.zacharyreview@gmail.com"
export OWNER_PHONE="555-555-5555"
export AUTH_FACEBOOK_KEY="467842340019517"
export AUTH_FACEBOOK_SECRET="de00b6ee1e63e5a951d76f9fa5447448"
export AUTH_TWITTER_KEY="ziR1OQ5bw1zEaPmcZropYHgvd"
export AUTH_TWITTER_SECRET="qgEiUtjMzLcAdPUBrouFjdczbJEoTzzMYrITXW0jbZTd4gsoS1"
export DEVISE_SECRET_KEY='2b9ad790ff93dab61f7a47904f62ce44e3e5ac8a0dd721a87c931d86b5aa3996615f1140d4c524357e024a73c5761161d290c819bd13a0636fc7c859da049874'
export DEVISE_PEPPER='58cf46b444b5802e6ddd522b0c68acdfb3b8ea41bdef4fc518061df6a25344657b7a7971ab8bc2e7d1f06840adc1fd573c26746ffc81f0abb636da32c5256a9f'
export SECRET_KEY_BASE='4c1f7987ef0e9818ec8f8a215f25c114bc36524daf41f9b1fc41a328089696c77901184f52c895f60740dba1def393bc92f255e2d0468bb1c8c67c105e634d17'
export MAIL_HOST="localhost:3000"
export DOMAIN="localhost:3000"
export NEW_RELIC_LICENSE_KEY="5fff3d1d411dad2aa9698903c8360a81638c675f"
export GOOGLE_API_KEY="AIzaSyAirY0f50yROtfp_vG8y5WmKnr51cFDfWQ"
export GOOGLE_PASSWORD="bumble7#^bee"
export GOOGLE_USERNAME="info.zacharyreview"
export REDIS_URL="localhost:6379"
