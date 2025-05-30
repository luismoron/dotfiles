export EDITOR=/usr/bin/code
~/.i3/scripts/monitor_detect.sh
dmonitor &&
# Ejecutar fehbg para establecer el fondo de pantalla
if [ -f "$HOME/.fehbg" ]; then
    sh "$HOME/.fehbg" &
fi

# .zprofile

# Get the aliases and functions
if [ -f ~/.zshrc ]; then
    . ~/.zshrc
fi

# User specific environment and startup programs
