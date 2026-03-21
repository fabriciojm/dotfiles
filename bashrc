# .bashrc
#export BASH_CONF="bashrc"
#export TERM=xterm-256color
export TERM=screen-256color
#export PS1="\[\033[38;5;9m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;12m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;12m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

# ---------- Nord color palette ----------
NORD_DIR="\[\033[38;5;110m\]"      # Nord8
NORD_GIT="\[\033[38;5;142m\]"      # Nord14
NORD_PROMPT="\[\033[38;5;67m\]"    # Nord9
NORD_DIRTY="\[\033[38;5;203m\]"    # red accent
RESET="\[\033[0m\]"

# ---------- Git info ----------
git_info() {
  local branch dirty

  branch=$(git branch --show-current 2>/dev/null)
  [ -z "$branch" ] && return

  git diff --quiet --ignore-submodules HEAD 2>/dev/null
  if [ $? -ne 0 ]; then
    dirty="*"
  fi

  echo "(${branch}${dirty})"
}

# ---------- Prompt ----------
PS1="${NORD_DIR}\w${RESET} ${NORD_GIT}\$(git_info)${RESET}\n${NORD_PROMPT}\\$ ${RESET}"



export PATH=$HOME/bin:$PATH
#export TERMINFO=$HOME/.terminfo

# Source global definitions
#if [ -f /etc/bashrc ]; then
#	. /etc/bashrc
#fi

# User specific aliases and functions

alias new="tmux new -s t1"
alias attach="tmux attach -t t1"
alias ls='ls --color=auto'
alias ll="ls -lhA"
alias la="ls"
alias sl="ls"
alias ks="ls"
alias ka="ls"
alias l="ls"
alias s="ls"
alias no="cd ~/notes/"
alias recon="killall -10 tmux"
alias dime="readlink -f"
export EDITOR=vim

alias more='less -i'
alias less='less -i '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
