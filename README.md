# Takuyan's Portable Dotfiles (macOS)

## Packages

- [rbenv](https://github.com/rbenv/rbenv)
- [ruby-build](https://github.com/rbenv/ruby-build)
- [zsh](https://www.zsh.org/)
- [Neovim + LazyVim](https://www.lazyvim.org/)

## Configs

- rbenv (and ruby-build)
- zshrc / zshenv / bashrc
- Neovim config (LazyVim-based)
- vimrc / gvimrc
- wezterm
- powconfig / gitignore

## Usage

```sh
./install.sh
```

## Local Overrides

- Keep machine-specific values (secrets, work-only paths) out of this repo.
- Put bash-only local overrides in `~/.bashrc.local`.
- Put zsh-only local overrides in `~/.zshrc_ext`.
