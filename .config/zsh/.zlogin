# ~/.config/zsh/.zlogin

###----------------- START-X ----------------------###
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

