# ~/.config/zsh/.zlogin

# Start X display server
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
