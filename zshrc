source <(antibody init)

eval "$(rbenv init -)"
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
  
export POW_EXT_DOMAINS=localhost

HISTFIL=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Autocorrect misspelled commands
setopt correct

# Setup completion
setopt automenu
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
  '+l:|?=** r:|?=**'


# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
# setopt share_history

autoload -U promptinit; promptinit

antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle peterhurford/git-it-on.zsh
antibody bundle zsh-users/zsh-completions
antibody bundle Tarrasch/zsh-bd
antibody bundle buonomo/yarn-completion

export EDITOR=vim
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

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
export PATH="/usr/local/opt/openssl/bin:$PATH"

export PATH="$HOME/.bin:$PATH"
