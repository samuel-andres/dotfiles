# ~/.config/zsh/.zshenv

# X
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc

# OMZ
export ZSH="$XDG_DATA_HOME"/oh-my-zsh

# NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export PYTHON_HISTORY="$XDG_STATE_HOME"/python/history
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# Android SDK
export ANDROID_HOME="$XDG_DATA_HOME"/android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android

# Node
export NODE_OPTIONS="--max-old-space-size=8192"
export NODE_REPL_HISTORY=""

# Add .local/bin packages to the PATH
export PATH=$PATH:~/.local/bin

# Add opt packages to the PATH
export PATH=$PATH:/opt/emojipick:/opt/flipper:/Postman:/opt/android-studio/bin

# Add cargo packages to the PATH
export PATH=$PATH:"$XDG_DATA_HOME"/cargo/bin
