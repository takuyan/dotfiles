# Takuyan's Portable Dotfiles (macOS)

## Packages

- Baseline packages are managed in `Brewfile`.
- Optional tools are managed in `Brewfile.optional`.

## Configs

- rbenv (and ruby-build)
- zshrc / zshenv / bashrc
- Neovim config (LazyVim-based)
- starship prompt config
- vimrc / gvimrc
- wezterm
- powconfig / gitignore

## Usage

```sh
# baseline only
./install.sh

# include optional tools
DOTFILES_INCLUDE_OPTIONAL=1 ./install.sh
```

## Local Overrides

- Keep machine-specific values (secrets, work-only paths) out of this repo.
- Put bash-only local overrides in `~/.bashrc.local`.
- Put zsh-only local overrides in `~/.zshrc_ext`.
