fpath=($HOME/.zsh-completions/src $fpath)

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="ys"
ZSH_THEME="ys"
#ZSH_THEME="macovsky-ruby"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# git
alias gb='git branch'
alias gch='git checkout'
alias gs='git status'
alias gco='git commit'
alias gcm='git commit -m'
alias gl='git log'
alias gd='git diff'
alias gaa='git add --all'
alias gap='git add -p'

# basic
alias ll='ls -la'
alias rm='rm -i'
alias mkdir='mkdir -p'

# rails
alias r='rails'
alias be='bundle exec'

# project
alias life='cd ~/dev/github/proofoflife'
alias bmg='cd ~/dev/github/bmg'
alias kulku='cd ~/dev/github/kulku'
alias blog='cd ~/dev/github/blog'
alias pplog='cd ~/dev/github/pplog'
alias esa='cd ~/dev/github/esa'
alias doit='cd ~/dev/github/doit'

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

# Customize to your needs...
export PATH=$HOME/.nodebrew/current/bin:$HOME/android-sdk/tools:$HOME/android-sdk/platform-tools:$HOME/Dropbox/aws/RDSCli-1.4.007/bin:/usr/local/sbin:$HOME/.rbenv/shims:$HOME/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Added by Nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Added by Rails binstubs
export PATH="./bin:$PATH"

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
