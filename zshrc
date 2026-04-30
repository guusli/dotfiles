# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Completion cache settings
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zcompcache"


source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
eval "$(fnm env --use-on-cd --shell=zsh --log-level=quiet)"

# zsh-z: alias z to j
export ZSHZ_CMD=j

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

setopt correct
setopt share_history
setopt hist_verify
setopt hist_reduce_blanks
setopt inc_append_history

eval "$(fnm env --use-on-cd --shell=zsh --log-level=quiet)"

# Setup completion BEFORE antidote so plugins can use compdef
autoload -Uz compinit
compinit -C

antidote load

# zsh-z completion (bind alias to completion function)
compdef _zshz j

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|?=** r:|?=**'
zstyle ':completion:*' recent-dirs yes

export EDITOR=vim

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

source <(fzf --zsh)

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'

fbr() {
	local branches branch
	branches=$(git branch -a) &&
	branch=$(echo "$branches" | fzf +s +m -e) &&
	git checkout $(echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::")
}


fkill() {
	local pid
	pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

	if [ "x$pid" != "x"  ]
	then
		echo $pid | xargs kill -${1:-9}
	fi
}

mkcd() {
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

alias lg="lazygit"
export PATH="/usr/local/opt/openssl/bin:$PATH"

export PATH="$HOME/.bin:$PATH"

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"
