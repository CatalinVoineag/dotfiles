
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize


[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac


if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
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

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias be='bundle exec'
alias berc='bundle exec rails c'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias glp='git log --oneline --all --graph --decorate'
alias gco='git checkout'
alias weather='curl wttr.in/manchester'
alias catchup='git fetch --all && git rebase origin/master'
alias branches="git for-each-ref --count=10 --sort=-committerdate refs/heads/ --format='%(committerdate:short) %(authorname) %(refname:short)'"
alias befs="bundle exec foreman start"
alias bep="bundle exec puma -e development -C config/puma.rb"
alias beu="bundle exec unicorn -c config/unicorn.rb -E development"

alias cd_work='cd /home/catalin/code/work'
alias cd_core='cd /home/catalin/code/work/itt-mentor-services'
alias cd_main='cd /home/catalin/code/work/itt-mentor-services/main'

alias cd_play='cd /home/catalin/code/play'
alias cd_advent='cd /home/catalin/code/play/advent_of_code'
alias cd_dotfiles='cd ~/.config/dotfiles'

alias upd="sudo apt update && sudo apt upgrade"

alias run_monitor='xrandr --output HDMI-A-0 --mode 2560x1440 && xrandr --output eDP --off'

alias run_laptop='xrandr --output eDP --auto'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="/home/catalin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
. /home/catalin/.asdf/asdf.sh

complete -C /usr/bin/terraform terraform
. /home/catalin/.asdf/asdf.sh

# run tmux sessioniser
bind -x '"\C-f": /home/catalin/.config/dotfiles/tmux-sessioniser'

# Fzf bindings and completion
source /usr/share/doc/fzf/examples/key-bindings.bash
. "$HOME/.cargo/env"

# Go paths
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export KAMAL_REGISTRY_PASSWORD="Z*KvXRz$&SjtL8"

export PATH=$PATH:/home/catalin/.spicetify

# ruby install gem path
export PATH="$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH"

export EDITOR=nvim
