# Minimal bash compatibility config.
# Primary interactive shell settings live in zshrc.

alias ll='ls -la'

# Ruby
if [ -d "$HOME/.rbenv/bin" ] ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
fi
if command -v rbenv >/dev/null 2>&1 ; then
  eval "$(rbenv init - bash)"
fi

# Node.js
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ] ; then
  . "$NVM_DIR/nvm.sh"
fi
if [ -s "$NVM_DIR/bash_completion" ] ; then
  . "$NVM_DIR/bash_completion"
fi

# Machine-local overrides (secrets, work-only paths, etc.)
if [ -f "$HOME/.bashrc.local" ] ; then
  . "$HOME/.bashrc.local"
fi
