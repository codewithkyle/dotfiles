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

source ~/.nvm/nvm.sh

alias vi="nvim"
alias vim="nvim"
alias python=/usr/bin/python3

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.local/scripts
alias open="explorer.exe ."
alias drop="git stash && git stash drop"
alias own="sudo chmod -R 775 ./ && sudo chown -R $USER:www-data ./"
alias rustc="~/.cargo/bin/rustc"
alias cargo="~/.cargo/bin/cargo"
alias rustup="~/.cargo/bin/rustup"
#alias xclip="clip.exe"
alias c="xclip -selection clipboard"
alias v="xclip -o"
alias air='~/go/bin/air'
alias ga="git add ."
alias gc="git commit -m "
alias qpr="$HOME/scripts/quick-pr.sh"
alias dnuke='docker rm -f $(docker ps -aq) && docker system prune -af --volumes'
alias dbuild="docker compose up --build"
alias lg="lazygit"
