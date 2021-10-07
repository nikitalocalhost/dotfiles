# P10K instant prompt

export POWERLEVEL9K_INSTANT_PROMPT="quiet"
export POWERLEVEL9K_INSTANT_PROMPT_FILE=${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh
if [[ -r $POWERLEVEL9K_INSTANT_PROMPT_FILE ]]; then
	source $POWERLEVEL9K_INSTANT_PROMPT_FILE
fi

# History

HISTFILE=$HISTFILE
HISTSIZE=10000
SAVEHIST=10000
setopt BANG_HIST
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY

bindkey -e

# Home / End keys

bindkey '\e[1~' beginning-of-line
bindkey '\e[H' beginning-of-line
bindkey '\eOH' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[F' end-of-line
bindkey '\eOF' end-of-line

# Aliases

alias dotfiles='/usr/bin/env git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

alias e='$EDITOR'
alias ez='e $ZDOTDIR/.zshrc'
alias mpv='noglob mpv'


# ZPlug init

ZPLUG_HOME=$XDG_CACHE_HOME/zplug

if [[ ! -f $ZPLUG_HOME/init.zsh ]]; then
  git clone --recursive https://github.com/zplug/zplug.git $ZPLUG_HOME
fi

source $ZPLUG_HOME/init.zsh

# ZPlug plugins

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "romkatv/powerlevel10k", as:theme


if ! zplug check; then
	zplug install
fi

zplug load

# P10K config

export POWERLEVEL9K_CONFIG_FILE="$XDG_CACHE_HOME/p10k/$TERM.zsh"
[[ ! -f $POWERLEVEL9K_CONFIG_FILE ]] || source $POWERLEVEL9K_CONFIG_FILE
