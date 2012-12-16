fpath=($HOME/.zsh-completions/src $fpath)

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="macovsky-ruby"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# git
alias gb='git branch'
alias gch='git checkout'
alias gs='git status'
alias ga='git add'
alias gco='git commit'
alias gl='git log'
alias gd='git diff'

# basic
alias ll='ls -la'
alias rm='rm -i'

# rails
alias r='rails'
alias rs='bundle exec rspec --drb --color'
alias be='bundle exec'

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
plugins=(rails3 git ruby pow bundler rbenv bunder gem pow redis-cli)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$HOME/.nodebrew/current/bin:$HOME/android-sdk/tools:$HOME/android-sdk/platform-tools:$HOME/Dropbox/aws/RDSCli-1.4.007/bin:/usr/local/sbin:$HOME/.rbenv/shims:$HOME/.rbenv/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
