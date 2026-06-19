setopt PROMPT_SUBST

export TERM=xterm-256color

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

FG="#e6e6e6"
DIM="#9aa0a6"
MUTED="#6b6b6b"
ACCENT="#1793d0"

git_branch() {
  git rev-parse --is-inside-work-tree &>/dev/null || return

  local branch
  branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null \
        || git rev-parse --short HEAD 2>/dev/null)

  echo "%F{$DIM}git:%f%F{$ACCENT}${branch}%f"
}

PROMPT='%F{$FG}%n%F{$DIM}@%F{$FG}%m%f %F{$FG}%~%f $(git_branch)%F{$ACCENT}❯%f '
