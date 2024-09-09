# ~/.bashrc

###----------------- OPTIONS ----------------------###
set -o vi # vi mode
stty -ixon # disable C-s from freezing terminal
bind '"\C-f":"tmux-sessionizer\n"' # custom keybinding

###------------------- PROMPT ---------------------###
source /usr/share/git-core/contrib/completion/git-prompt.sh
blue=$'\033[38;2;125;174;163m'
orange=$'\033[38;2;215;153;33m'
green=$'\033[38;2;133;153;0m'
red=$'\033[38;2;204;102;102m'
PS1='\[${blue}\]\h:\[${orange}\]\W\[${green}\]$(__git_ps1 ":%s")\[${red}\]\$\[\033[0m\] '

###------------------- EVALS ----------------------###
command -v fnm &> /dev/null && eval "$(fnm env --use-on-cd)"
command -v fzf &> /dev/null && eval "$(fzf --bash)"
command -v pyenv &> /dev/null && eval "$(pyenv init -)"

###------------------ ALIASES ---------------------### 
alias vim=nvim
alias ls="ls --color"
alias lf="lff"
alias b=". bkekw"
alias gg="lazygit"
alias cpc="xsel --clipboard --input"
alias cfv="cd $XDG_CONFIG_HOME/nvim && nvim ."
