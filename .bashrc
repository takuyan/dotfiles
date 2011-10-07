alias ll='ls -la'
alias r='rails'

alias gb='git branch'
alias gc='git checkout'
alias gs='git status'
alias ga='git add'
alias gc='git commit'

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function precmd() {
  PROMPT="\h@\u:\W\$(parse_git_branch) \$ "
}
function proml {
  PS1="\h@\u:\W\$(parse_git_branch) \$ "
}
proml

