#=============================
# rbenv
#=============================
if [ -d ${HOME}/.rbenv  ] ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
fi

#=============================
# nodebrew
#=============================
if [ -f ~/.nodebrew/nodebrew ]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi
