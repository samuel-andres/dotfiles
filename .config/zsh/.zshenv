# ~/.config/zsh/.zshenv

###-------------------- X -------------------------###
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc

###------------------- XDG ------------------------###
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export PYTHON_HISTORY="$XDG_STATE_HOME"/python/history
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

###----------------- ANDROID ----------------------###
export ANDROID_HOME="$XDG_DATA_HOME"/android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android

###------------------ NODE ------------------------###
export NODE_OPTIONS="--max-old-space-size=8192"
export NODE_REPL_HISTORY=""

###------------------- ZSH ------------------------### 
export FPATH=$FPATH:$ZDOTDIR/functions

###------------------- PATH -----------------------### 
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/opt/Postman/app:/opt/android-studio/bin
export PATH=$PATH:"$XDG_DATA_HOME"/cargo/bin
export PATH=$PATH:"$XDG_DATA_HOME"/fzf/bin

