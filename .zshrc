export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
plugins=(git aws battery colorize cp docker docker-compose docker-machine dotenv emoji emoji-clock kubectl rust)
source $ZSH/oh-my-zsh.sh
alias gs='git switc'
alias gaa='git add -A'
alias gcam='git commit -am'
alias gpl='git pull --rebase'
alias gps='git push'
alias gpsf='git push --force'
alias grs='git rebase -i'
alias cm='cargo make'
