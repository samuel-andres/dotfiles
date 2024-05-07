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
zstyle ':completion:*' menu select    # enable tab menu
setopt extended_history               # record timestamp of command in HISTFILE
setopt hist_save_no_dups              # older commands that duplicate newer ones are omitted
setopt hist_expire_dups_first         # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups               # dont enter command lines into the HISTFILE if they are dups of the prev event
setopt hist_ignore_space              # ignore commands that start with space
setopt hist_verify                    # show command with history expansion to user before running it
setopt hist_ignore_all_dups           # remove older duplicate command when writing to the HISTFILE
setopt inc_append_history             # add commands to HISTFILE in order of execution
_comp_options+=(globdots)             # include hidden files

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
alias zshconfig="nvim $XDG_CONFIG_HOME/zsh/.zshrc"
alias zshreload="source $XDG_CONFIG_HOME/zsh/.zshrc"
alias sxhkdconfig="nano ~/.config/sxhkd/sxhkdrc"
alias dev="vscli open"
alias vi="nvim"
alias vim="nvim"
alias history="history 1"

###---------------- SYSTEM FETCH ------------------### 
fastfetch

