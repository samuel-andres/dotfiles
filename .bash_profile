# ~/.bash_profile

###------------------- XDG ------------------------###
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_RUNTIME_DIR=/run/user/$UID
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export PYTHON_HISTORY="$XDG_STATE_HOME"/python/history
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export PKG_CACHE_PATH="$XDG_CACHE_HOME"/pkg-cache

###-------------------- X -------------------------###
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc

###----------------- ANDROID ----------------------###
export ANDROID_HOME="$XDG_DATA_HOME"/android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android

###------------------ NODE ------------------------###
export NODE_OPTIONS="--max-old-space-size=8192"
export NODE_REPL_HISTORY=""

###----------------- PYENV ------------------------###
export PYENV_ROOT="$HOME/.pyenv"

###----------------- RIPGREP ----------------------###
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME"/ripgrep/ripgreprc

###------------------ EDITOR ----------------------###
export EDITOR=nvim

###------------------- PATH -----------------------###
export PATH=$PATH:~/.local/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:/opt/Postman/app:/opt/android-studio/bin
export PATH=$PATH:"$XDG_DATA_HOME"/cargo/bin
export PATH=$PATH:"$XDG_DATA_HOME"/fzf/bin
export PATH=$PATH:"$HOME/.local/src/tmuxifier/bin"
export PATH="$PYENV_ROOT/bin:$PATH"

###------------------- COLORS ---------------------###
export LS_COLORS="$(command -v vivid >/dev/null 2>&1 && vivid generate molokai || echo '')"

###------------------- HISTORY ---------------------###
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTCONTROL=erasedups:ignorespace
export HISTTIMEFORMAT="%Y-%m-%d %T "

###----------------- INTERACTIVE ------------------###
if [[ $- == *i* ]]; then
    . ~/.bashrc
fi

###----------------- START-X ----------------------###
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
