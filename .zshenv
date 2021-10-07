# XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

if [ ! -w ${XDG_RUNTIME_DIR:="/run/user/$UID"} ]; then
	XDG_RUNTIME_DIR=/tmp/run/$UID
	if [ ! -w $XDG_RUNTIME_DIR ]; then
		mkdir -p $XDG_RUNTIME_DIR
	fi
fi
export XDG_RUNTIME_DIR

# Zsh
export ZDOTDIR=$XDG_CONFIG_HOME
export HISTFILE=$XDG_STATE_HOME/zsh/history

# Elixir Mix
export MIX_HOME=$XDG_DATA_HOME/mix

# Go
export GOPATH=$XDG_DATA_HOME/go
path+=("$GOPATH/bin")

# Ruby bundler
export BUNDLE_USER_CONFIG=$XDG_CONFIG_HOME/bundle
export BUNDLE_USER_CACHE=$XDG_CACHE_HOME/bundle
export BUNDLE_USER_PLUGIN=$XDG_DATA_HOME/bundle

# Ruby gems
export GEM_HOME=$XDG_DATA_HOME/gem
export GEM_SPEC_CACHE=$XDG_CACHE_HOME/gem

# OCaml OPAM
export OPAMROOT=$XDG_DATA_HOME/opam
if [ -e $OPAMROOT/opam-init/init.zsh ]; then
	. $OPAMROOT/opam-init/init.zsh > /dev/null 2> /dev/null
fi

# Rust cargo
export CARGO_HOME=$XDG_DATA_HOME/cargo
path+=("$CARGO_HOME/bin")

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

# Node.js
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node_repl_history

# Node.js NPM
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config
export NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm
export NPM_CONFIG_TMP=$XDG_RUNTIME_DIR/npm

# Node.js Yarn
path+=("$HOME/.yarn/bin")
#alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

export PATH
