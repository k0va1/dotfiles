. $HOME/.asdf/asdf.sh

eval "$(starship init zsh)"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"

plugins=(archlinux git bundler docker docker-compose ruby zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration
unsetopt correct_all
# export MANPATH="/usr/local/man:$MANPATH"

### ALIASES ###
alias gt="git tag --sort=-v:refname"
alias gcan="git commit --amend --no-edit"
alias gb="git branch --sort='committerdate'"
alias gsta="git stash push"
alias gcod="gco develop"
alias gcom="gco master"
alias gdc="git diff --cached"
alias zcon="$EDITOR ~/.zshrc"
alias t="bundle exec rspec"
alias be="nocorrect bundle exec"
alias vim="nvim"
alias rm="rm -i"
alias open="xdg-open"

###-tns-completion-start-###
if [ -f $HOME/.tnsrc ]; then 
  source $HOME/.tnsrc 
fi
###-tns-completion-end-###

#pass update
PASSWORD_STORE_ENABLE_EXTENSIONS=true
PASSWORD_STORE_EXTENSIONS_DIR=/usr/local/lib/password-store/extensions
