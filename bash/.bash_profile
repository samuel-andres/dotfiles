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
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export PYENV_ROOT="$XDG_DATA_HOME"/pyenv
export HISTFILE="$XDG_STATE_HOME"/bash/history
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME"/ripgrep/ripgreprc
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

###----------------- ANDROID ----------------------###
export ANDROID_HOME="$XDG_DATA_HOME"/android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android

###------------------ NODE ------------------------###
export NODE_OPTIONS="--max-old-space-size=8192"
export NODE_REPL_HISTORY=""
export NPM_CONFIG_PREFIX="$HOME"/.local/share/npm/.npm-global

###------------------ EDITOR ----------------------###
export EDITOR=nvim

###------------------- PATH -----------------------###
export PATH=$PATH:~/.local/bin
export PATH=$PATH:"$ANDROID_HOME"/tools
export PATH=$PATH:"$ANDROID_HOME"/emulator
export PATH=$PATH:"$ANDROID_HOME"/tools/bin
export PATH=$PATH:"$ANDROID_HOME/platform-tools"
export PATH=$PATH:/opt/postman:/opt/android-studio/bin
export PATH=$PATH:"$XDG_DATA_HOME"/cargo/bin
export PATH=$PATH:"$XDG_DATA_HOME"/fzf/bin
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
export PATH=$PATH:"$HOME"/.local/share/npm/.npm-global/bin

###------------------- HISTORY ---------------------###
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTCONTROL=erasedups:ignorespace
export HISTTIMEFORMAT="%Y-%m-%d %T "

###------------------- WAYLAND ---------------------###
export QT_QPA_PLATFORM=wayland
export LIBSEAT_BACKEND=logind

###----------------- INTERACTIVE #------------------###
if [[ $- == *i* ]]; then
    . ~/.bashrc
fi

###----------------- START-DE ---------------------###
if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec river
fi

