# Takuyan's Portable Dotfiles (macOS)

## Packages

- Baseline packages are managed in `Brewfile`.
- Optional tools are managed in `Brewfile.optional`.

## Configs

- rbenv (and ruby-build)
- zshrc / zshenv / bashrc
- Neovim config (LazyVim-based)
- starship prompt config
- vimrc
- wezterm
- gitignore

## Setup Flow

```sh
# 1) Install packages from Brewfile
./scripts/bootstrap.sh

# 2) Apply dotfiles symlinks
./scripts/apply.sh

# 3) Verify commands and links
./scripts/verify.sh

# include optional tools in bootstrap/install
DOTFILES_INCLUDE_OPTIONAL=1 ./scripts/bootstrap.sh
DOTFILES_INCLUDE_OPTIONAL=1 ./install.sh
```

`./install.sh` runs all three steps in order.

## Local Overrides

- Keep machine-specific values (secrets, work-only paths) out of this repo.
- Put bash-only local overrides in `~/.bashrc.local`.
- Put zsh-only local overrides in `~/.zshrc_ext`.
