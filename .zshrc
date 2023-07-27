export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
plugins=(git aws battery colorize cp docker docker-compose docker-machine dotenv emoji emoji-clock kubectl rust)
source $ZSH/oh-my-zsh.sh
alias gs='git switch'
alias gaa='git add -A'
alias gcam='git commit -am'
alias gpl='git pull --rebase'
alias gps='git push'
alias gpsf='git push --force'
alias grs='git rebase -i'
alias ghpr='gh pr create --fill'
alias cm='cargo make'
alias spy='suite-py'
alias top='zenith'
alias gcb='git checkout -b'
alias xra='xrandr --auto'
alias xramulti='xrandr --auto --output DP-1-3 --mode 3440x1440 --above eDP-1-1'
alias xrasingle='xrandr --output DP-1-2 --mode 3440x1440'
alias awsp="source _awsp"
function aws_prof {
  local profile="${AWS_PROFILE:=default}"

  echo "%{$fg_bold[blue]%}aws:(%{$fg[yellow]%}${profile}%{$fg_bold[blue]%})%{$reset_color%} "
}
