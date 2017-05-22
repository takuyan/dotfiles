#=============================
# rbenv
#=============================
if [ -d ${HOME}/.rbenv  ] ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

#=============================
# nodebrew
#=============================
if [ -f ~/.nodebrew/nodebrew ]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  nodebrew use v7.10.0
fi
