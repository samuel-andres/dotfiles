# ~/.config/zsh/.zshrc

###----------------- HISTORY ----------------------###
HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=10000000
SAVEHIST=$HISTSIZE

###------------------ FUNCTIONS -------------------###
autoload -Uz \
	compinit \
	git_prompt_info \
	wp_out_headset \
	wp_out_speaker
compinit

###----------------- OPTIONS ----------------------###
zstyle ':completion:*' menu select
setopt extended_history
setopt hist_save_no_dups
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_ignore_all_dups
setopt inc_append_history
_comp_options+=(globdots)

###------------------- PROMPT ---------------------###
function update_prompt() {
    PROMPT="%F{blue}%~$(git_prompt_info) %(?.%F{green}.%F{red})%#%f "
}
precmd_functions+=(update_prompt)

###------------------ PLUGINS ---------------------###
source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

###------------------- EVALS ----------------------###
eval "$(fnm env --use-on-cd)"
eval "$(fzf --zsh)"

###------------------ ALIASES ---------------------### 
alias adb='HOME="$XDG_DATA_HOME"/android adb'
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias zshcfg="nvim $XDG_CONFIG_HOME/zsh/"
alias zshreload="source $XDG_CONFIG_HOME/zsh/.zshrc"
alias vimcfg="nvim $XDG_CONFIG_HOME/nvim"
alias dev="vscli open"
alias vi="nvim"
alias vim="nvim"
alias history="history 1"

###---------------- SYSTEM FETCH ------------------### 
fastfetch

