fpath=($HOME/.zsh-completions/src $fpath)

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"
#ZSH_THEME="bira"
#ZSH_THEME="eastwood"
#ZSH_THEME="macovsky-ruby"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# vim
# https://twitter.com/a_matsuda/status/899415149341065216
function v() {nvim ${${=*/:/ +}/:*}}

# git
alias gb='git branch'
alias gch='git checkout'
alias gs='git status'
alias gc='git commit -m'
alias gco='git commit'
alias gca='git commit --amend'
alias gl='git log'
alias gf='git fetch'
alias gm='git merge'
alias gr='git rebase'
alias gd='git diff'
alias gdc='git diff --cached'
alias gaa='git add --all'
alias gap='git add -p'
alias gp='git push'
alias gdb="git branch --merged | grep -vE '^\*|master$|release$|develop$' | xargs -I % git branch -d %"

clone() {
  local yes_cd=true
  while getopts "d:" OPTION
  do
    case $OPTION in
      d)
        local yes_cd=false
        shift
        ;;
    esac
  done
  if [[ -z $2 ]]; then
    local repo_name=$1
    while [ "${repo_name%%/*}" != "$repo_name" ]; do
       repo_name=${repo_name#*/}
    done
    repo_name=${repo_name%.*}
    git clone $1
    if $yes_cd; then; cd $repo_name; fi
  else
    if [[ $# -eq 3 ]]; then
      git clone git@github.com:$1/$2.git $3
      if $yes_cd; then; cd $3; fi
    else
      git clone git@github.com:$1/$2.git
      if $yes_cd; then; cd $2; fi
    fi
  fi
}

# basic
alias ll='ls -la'
alias rm='rm -i'
alias mkdir='mkdir -p'

# bundler
alias b='bundle'
alias be='bundle exec'
alias bu='bundle update'

# rails
alias r='rails'
alias rrp='bundle exec rake routes | peco'

# middleman
alias bem='bundle exec middleman'

# brew install colordiff
alias diff='colordiff'
alias less='less -R'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git pow bundler rbenv bunder gem pow redis-cli)

source $ZSH/oh-my-zsh.sh

# rbenvの初期化
if type rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# Homebrew
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# Added by Rails binstubs
export PATH="./bin:$PATH"

# v8
export PATH="/usr/local/opt/v8@3.15/bin:$PATH"

if [ -d ${HOME}/.plenv ] ; then
  export PATH="$HOME/.plenv/bin:$PATH"
  eval "$(plenv init -)"
fi

# added by travis gem
if [ -d ${HOME}/.travis ] ; then
  source ~/.travis/travis.sh
fi

if [ -e ${HOME}/.zshrc_ext ] ; then
  source ~/.zshrc_ext
fi

export EDITOR=vim

eval "$(direnv hook zsh)"

# java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# rbenv
export PATH=$HOME/.rbenv/shims:$PATH

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/takuyan/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/takuyan/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/takuyan/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/takuyan/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
