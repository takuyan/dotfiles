zsh_func()
{
  echo "[CHECK]   zsh-completions"
  if [ -d $HOME/.zsh-completions ]
  then
    echo "[UPDATE]  git pull zsh-completions"
    cd $HOME/.zsh-completions
    git pull origin master
    cd $HOME
  else
    echo "[INSTALL] git clone zsh-completions"
    git clone git://github.com/zsh-users/zsh-completions.git $HOME/.zsh-completions
  fi
}

zsh_func 1

