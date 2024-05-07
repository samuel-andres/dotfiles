# ~/.config/zsh/.zshrc

###----------------- HISTORY ----------------------###
HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=50000
SAVEHIST=$HISTSIZE

###----------------- OPTIONS ----------------------###
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

###------------------ FUNCTIONS -------------------###
autoload -Uz \
	compinit \
	git_prompt_info \
	wp_out_headset \
	wp_out_speaker
compinit

###------------------- PROMPT ---------------------###
function update_prompt() {
    PROMPT="%F{blue}%~$(git_prompt_info) %(?.%F{green}.%F{red})%#%f "
}
precmd_functions+=(update_prompt)

###------------------ PLUGINS ---------------------###
zstyle ':completion:*' menu select
source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

###------------------- EVALS ----------------------###
eval "$(fnm env --use-on-cd)"
eval "$(fzf --zsh)"

###------------------ ALIASES ---------------------### 
alias adb='HOME="$XDG_DATA_HOME"/android adb'
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias zshconfig="nvim $XDG_CONFIG_HOME/zsh/.zshrc"
alias zshreload="source $XDG_CONFIG_HOME/zsh/.zshrc"
alias sxhkdconfig="nano ~/.config/sxhkd/sxhkdrc"
alias dev="vscli open"
alias vi="nvim"
alias vim="nvim"
alias history="history 1"

###---------------- SYSTEM FETCH ------------------### 
fastfetch

