# ~/.bash_profile

###------------------- SKEL ------------------------###
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

###-------------------- X -------------------------###
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc

###------------------- XDG ------------------------###
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export PYTHON_HISTORY="$XDG_STATE_HOME"/python/history
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export PKG_CACHE_PATH="$XDG_CACHE_HOME"/pkg-cache

###----------------- ANDROID ----------------------###
export ANDROID_HOME="$XDG_DATA_HOME"/android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android

###------------------ NODE ------------------------###
export NODE_OPTIONS="--max-old-space-size=8192"
export NODE_REPL_HISTORY=""

###------------------- PATH -----------------------### 
export PATH=$PATH:~/.local/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:/opt/Postman/app:/opt/android-studio/bin
export PATH=$PATH:"$XDG_DATA_HOME"/cargo/bin
export PATH=$PATH:"$XDG_DATA_HOME"/fzf/bin
export PATH=$PATH:"$HOME/.local/src/tmuxifier/bin"

###----------------- START-X ----------------------###
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

###----------------- PYENV ------------------------###
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
