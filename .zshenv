# XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Zsh
export ZDOTDIR=$XDG_CONFIG_HOME
export HISTFILE=$XDG_STATE_HOME/zsh/history

# Elixir Mix
export MIX_HOME=$XDG_DATA_HOME/mix

# Go
export GOPATH=$XDG_DATA_HOME/go

# Ruby bundler
export BUNDLE_USER_CONFIG=$XDG_CONFIG_HOME/bundle
export BUNDLE_USER_CACHE=$XDG_CACHE_HOME/bundle
export BUNDLE_USER_PLUGIN=$XDG_DATA_HOME/bundle

# Ruby gems
export GEM_HOME=$XDG_DATA_HOME/gem
export GEM_SPEC_CACHE=$XDG_CACHE_HOME/gem

# Rust cargo
export CARGO_HOME=$XDG_DATA_HOME/cargo

# Rust Rustup
export RUSTUP_HOME=$XDG_DATA_HOME/rustup

# Python virtualenv
export WORKON_HOME=$XDG_DATA_HOME/virtualenvs

# Visual Studio Code
#export VSCODE_PORTABLE=$XDG_DATA_HOME/vscode # https://github.com/Microsoft/vscode/issues/3884

# WGet
#export WGETRC=$XDG_CONFIG_HOME/wgetrc
#alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

# XInit
#export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc
#export XSERVERRC=$XDG_CONFIG_HOME/X11/xserverrc
# example usage with startx: startx "$XDG_CONFIG_HOME/X11/xinitrc" -- "$XDG_CONFIG_HOME/X11/xserverrc" vt1

# Yarn
#alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

