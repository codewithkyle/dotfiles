if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gruvbox"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias vi="nvim"
alias vim="nvim"
alias python=/usr/bin/python3

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.local/scripts
alias vi="nvim"
alias vim="nvim"
alias python=/usr/bin/python3
alias drop="git stash && git stash drop"
alias own="sudo chmod -R 775 ./ && sudo chown -R $USER:www-data ./"
alias rustc="$HOME/.cargo/bin/rustc"
alias cargo="$HOME/.cargo/bin/cargo"
alias rustup="$HOME/.cargo/bin/rustup"
alias air='~/go/bin/air'
alias ga="git add ."
alias gc="git commit -m "
alias qpr="$HOME/scripts/quick-pr.sh"
alias dnuke='docker rm -f $(docker ps -aq) && docker system prune -af --volumes'
alias dbuild="docker compose up --build"
alias lg="lazygit"
alias serve="python3 -m http.server 8080 --bind 127.0.0.1"
