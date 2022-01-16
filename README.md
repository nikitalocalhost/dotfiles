# My dotfiles

## Installing
```bash
export DOTFILES_URL=https://github.com/nikitalocalhost/dotfiles.git
export DOTFILES_DIR=$HOME/.dotfiles

alias dotfiles='git --git-dir=$DOTFILES_DIR --work-tree=$HOME'
git clone --bare $DOTFILES_URL $DOTFILES_DIR
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```
