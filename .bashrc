# ~/.bashrc

###------------------- SKEL ------------------------###
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

###----------------- OPTIONS ----------------------###
# vi mode
set -o vi
# disable C-s from freezing terminal
stty -ixon
# custom keybindings
bind '"\C-f":"tmux-sessionizer\n"'

###------------------- PROMPT ---------------------###
source /usr/share/git-core/contrib/completion/git-prompt.sh
orange=$'\033[38;2;215;153;33m'
green=$'\033[38;2;133;153;0m'
red=$'\033[38;2;204;102;102m'
export PS1='\[${orange}\]\W\[${green}\]$(__git_ps1 ":%s")\[${red}\]\$\[\033[0m\] '

###------------------- EVALS ----------------------###
command -v fnm &> /dev/null && eval "$(fnm env --use-on-cd)"
command -v fzf &> /dev/null && eval "$(fzf --bash)"
# command -v pyenv &> /dev/null && eval "$(pyenv virtualenv-init -)"

###------------------ ALIASES ---------------------### 
alias adb='HOME="$XDG_DATA_HOME"/android adb'
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias cfb="cd $XDG_CONFIG_HOME/bash && nvim ."
alias cfv="cd $XDG_CONFIG_HOME/nvim && nvim ."
alias cfr="cd $XDG_CONFIG_HOME/ranger && nvim ."
alias cft="cd $XDG_CONFIG_HOME/tmux && nvim ."
alias vi="nvim"
alias vim="nvim"
alias r="ranger"
alias b=". bkekw"
alias syadm="sudo yadm --yadm-dir /etc/yadm --yadm-data /etc/yadm/data"
alias gg="lazygit"
alias cpc="xsel --clipboard --input"

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
echo 'eval "$(pyenv init -)"' >> ~/.profile
