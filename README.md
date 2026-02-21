# Takuyan's Portable Dotfiles (macOS)

## Packages

- [rbenv](https://github.com/rbenv/rbenv)
- [ruby-build](https://github.com/rbenv/ruby-build)
- [zsh](https://www.zsh.org/)
- [Neovim + LazyVim](https://www.lazyvim.org/)
- [starship](https://starship.rs/)

## Configs

- rbenv (and ruby-build)
- zshrc / zshenv / bashrc
- Neovim config (LazyVim-based)
- starship prompt config
- vimrc / gvimrc
- wezterm
- powconfig / gitignore

## Setup Flow

```sh
# 1) Install packages from Brewfile
./scripts/bootstrap.sh

# 2) Apply dotfiles symlinks
./scripts/apply.sh

# 3) Verify commands and links
./scripts/verify.sh
```

`./install.sh` runs all three steps in order.

## Local Overrides

- Keep machine-specific values (secrets, work-only paths) out of this repo.
- Put bash-only local overrides in `~/.bashrc.local`.
- Put zsh-only local overrides in `~/.zshrc_ext`.
