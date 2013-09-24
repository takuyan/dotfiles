alias ll='ls -la'
alias r='rails'
alias rs='bundle exec rspec --drb --color'

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

export JAVA_HOME=/Library/Java/Home 
export AWS_RDS_HOME=$HOME/Dropbox/aws/RDSCli-1.4.007
export PATH=$AWS_RDS_HOME/bin:$PATH
export EC2_CERT=$HOME/Dropbox/aws/dev_freebell_net/cert-C7QZZPDKQ4HTSEOANS6GUTK3QXWUWQRS.pem
export EC2_PRIVATE_KEY=$HOME/Dropbox/aws/dev_freebell_net/pk-C7QZZPDKQ4HTSEOANS6GUTK3QXWUWQRS.pem
export EC2_URL=https://ec2.ap-northeast-1b.amazonaws.com
export EC2_REGION=ap-northeast-1


# added by travis gem
source ~/.travis/travis.sh

