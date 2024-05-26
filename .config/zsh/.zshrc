# ~/.config/zsh/.zshrc

###----------------- HISTORY ----------------------###
HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=10000000
SAVEHIST=$HISTSIZE

###------------------ FUNCTIONS -------------------###
autoload -Uz \
    compinit \
    git-prompt-info \
    wp-out-headset \
    wp-out-speaker \
    zle-keymap-select \
    zle-line-init \
    edit-command-line 
compinit

###----------------- OPTIONS ----------------------###
# completion options
zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-fordward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-fordward-char
_comp_options+=(globdots)
# history options
setopt extended_history
setopt hist_save_no_dups
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_ignore_all_dups
setopt inc_append_history
# vi mode
function update_cursor() {
    echo -ne '\e[5 q'
}
zle -N zle-keymap-select
zle -N zle-line-init
zle -N edit-command-line
bindkey -v
bindkey '^V' edit-command-line
bindkey "^?" backward-delete-char
precmd_functions+=(update_cursor)

###------------------- PROMPT ---------------------###
function update_prompt() {
    PROMPT="%F{blue}%~$(git-prompt-info) %(?.%F{green}.%F{red})%#%f "
}
precmd_functions+=(update_prompt)

###------------------ PLUGINS ---------------------###
source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

###------------------- EVALS ----------------------###
eval "$(fnm env --use-on-cd)"
eval "$(fzf --zsh)"
eval "$(tmuxifier init -)"

###------------------ ALIASES ---------------------### 
alias adb='HOME="$XDG_DATA_HOME"/android adb'
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias zshreload="source $XDG_CONFIG_HOME/zsh/.zshrc"
alias cfz="cd $XDG_CONFIG_HOME/zsh/ && nvim"
alias cfv="cd $XDG_CONFIG_HOME/nvim && nvim"
alias cfr="cd $XDG_CONFIG_HOME/ranger && nvim"
alias cft="cd $XDG_CONFIG_HOME/tmux && nvim"
alias dev="vscli open"
alias vi="nvim"
alias vim="nvim"
alias history="history 1"
alias r="ranger"
alias b=". bkekw"
alias sr="ffmpeg -f x11grab -s $(awk '/dimensions/ {print $2}' <(xdpyinfo)) -i :0.0 output.mp4"

###---------------- SYSTEM FETCH ------------------### 
fastfetch

