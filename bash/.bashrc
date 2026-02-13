# ~/.bashrc

###----------------- OPTIONS ----------------------###
set -o vi # vi mode
stty -ixon # disable C-s from freezing terminal
bind -x '"\C-f": tmux-sessionizer' # custom keybinding
bind -x '"\C-a": tmux a || tmux' # custom keybinding

###------------------- PROMPT ---------------------###
source /usr/share/git-core/contrib/completion/git-prompt.sh
blue=$'\033[38;2;125;174;163m'
orange=$'\033[38;2;215;153;33m'
green=$'\033[38;2;133;153;0m'
red=$'\033[38;2;204;102;102m'
PS1='\[${blue}\]\h:\[${orange}\]\W\[${green}\]$(__git_ps1 ":%s")\[${red}\]\$\[\033[0m\] '

###------------------- EVALS ----------------------###
command -v fnm &> /dev/null && eval "$(fnm env --use-on-cd --shell bash)"
command -v fzf &> /dev/null && eval "$(fzf --bash)"
command -v pyenv &> /dev/null && eval "$(pyenv init -)"
command -v brew &> /dev/null && eval "$(brew shellenv)"

###------------------- EXPORTS --------------------###
export GPG_TTY=$(tty)

###------------------ ALIASES ---------------------###
alias vim="nvim"
alias ls="ls --color"
alias adb='HOME="$XDG_DATA_HOME"/android adb'
alias stow="stow -d $HOME/.dotfiles"
