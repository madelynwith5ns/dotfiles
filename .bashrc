# The messiest bashrc in history!

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

# If this is an xterm set the title to user@host:dir
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
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH=~/.local/bin:$PATH

# get with the times grandma
# its not vi anymore its "nvim" now
alias vi='nvim'

. "$HOME/.cargo/env"

export USER_NICK=madelyn
#export PFP="$(wezterm imgcat --resize 24x24 ~/Pictures/picrew-witch-bash-ctp.png)"
export PFP="$(cat ~/profile.txt)"
# Latte
#PROMPT_COMMAND='PS1_CMD2=$(__git_ps1 " (\ue725 %s)")'; PS1='$PFP\[\e[38;2;4;65;229m\](\e[38;2;234;118;203m$(nick)\e[38;2;188;192;204m@\e[38;2;234;118;203m\h\e[38;2;4;165;229m)\e[38;2;114;135;253m${PS1_CMD2}\[\e[0m\] \[\e[38;2;136;57;239m\]( \w)\n ~\[\e[0m\] '
# Mocha
#PROMPT_COMMAND='PS1_CMD2=$(__git_ps1 " (\ue725 %s)")'; PS1='$PFP\[\e[38;2;116;199;236m\](\e[38;2;245;194;231m$(nick)\e[38;2;205;214;244m@\e[38;2;245;194;231m\h\e[38;2;116;199;236m)\e[38;2;148;226;213m${PS1_CMD2}\[\e[0m\] \[\e[38;2;203;166;247m\]( \w)\n ~\[\e[0m\] '
# Macchiato
PROMPT_COMMAND='PS1_CMD2=$(__git_ps1 " (\ue725 %s)")'; PS1='$PFP\[\e[38;2;125;196;228m(\e[38;2;245;189;230m$(nick)\e[38;2;202;211;245m@\e[38;2;245;189;230m\h\e[38;2;125;196;228m)\e[38;2;198;160;246m${PS1_CMD2}\[\e[0m\] \[\e[38;2;198;160;246m\]( \w)\n ~\[\e[0m\] '

# nvm or something
# i think this is nodejs???
# i dont remember lmfao
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Bashrc includes
# Mostly used for global secrets that I don't wanna put in my bashrc proper
source ~/.bashrc.includes/*

# bun or something
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# VM stuff
export PATH=/mnt/vmi/bin:$PATH

# git prompts!
source /usr/share/git/git-prompt.sh
