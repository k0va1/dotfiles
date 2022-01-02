. $HOME/.asdf/asdf.sh

eval "$(starship init zsh)"

export EDITOR="nvim"
export TERMINAL="urxvt"
export BROWSER="google-chrome-stable"
export GITHUB_ACCESS_TOKEN="c47088386532a21d2b094a0b037e0479b1f8d4f6"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export TERM="xterm-256color"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"

plugins=(archlinux git bundler docker docker-compose web-search gem npm ruby zsh-autosuggestions zsh_reload)

source $ZSH/oh-my-zsh.sh

# User configuration
unsetopt correct_all
# export MANPATH="/usr/local/man:$MANPATH"

### ALIASES ###
alias gt="git tag --sort=-v:refname"
alias gcan="git commit --amend --no-edit"
alias gb="git branch --sort='committerdate'"
alias gsta="git stash push"
alias cdt="cd $HOME/dev/teezily"
alias cdtb="cd $HOME/dev/t4b"
alias gcod="gco develop"
alias gcom="gco master"
alias zcon="$EDITOR ~/.zshrc"
alias t="bundle exec rspec"
alias be="nocorrect bundle exec"
alias t4bb="docker exec -it t4b_web_1 bash"
alias t4bc="docker exec -it t4b_web_1 rails c"
alias reconf="source $HOME/.zshrc"
alias vup="nmcli con up fuckrf"
alias vdn="nmcli con down fuckrf"
alias vim="nvim"
alias rm="rm -i"
alias open="xdg-open"

#export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
#export POSTGRES_USER=a.koval 

#test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

# Enable history in IEX
#export ERL_AFLAGS="-kernel shell_history enabled"

###-tns-completion-start-###
if [ -f $HOME/.tnsrc ]; then 
    source $HOME/.tnsrc 
fi
###-tns-completion-end-###

#pass update
PASSWORD_STORE_ENABLE_EXTENSIONS=true
PASSWORD_STORE_EXTENSIONS_DIR=/usr/local/lib/password-store/extensions
