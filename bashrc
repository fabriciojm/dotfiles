# .bashrc
export TERM=screen-256color

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

# User specific aliases and functions

alias ls='ls --color=auto'
alias ll="ls -lhA"
alias sl="ls"
alias dime="readlink -f"
alias path="echo $PATH | tr ':' '\n'"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
export EDITOR=vim

alias more='less -i'
alias less='less -i '

# kubernetes-related
alias k='kubectl'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"


source /etc/bash_completion
source <(kubectl completion bash)
complete -o default -F __start_kubectl k

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/home/fabricio/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
