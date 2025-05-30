# ~/.bashrc - Configuración básica para Oh My Bash

# Cargar Oh My Bash si está instalado
if [ -f "$HOME/.oh-my-bash/oh-my-bash.sh" ]; then
    export OSH="$HOME/.oh-my-bash"
    source "$OSH/oh-my-bash.sh"
fi

# Cambiar el tema (opcional)
OSH_THEME="font"

# Alias útiles
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Historial más grande y útil
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend

# Colores para grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# Prompt seguro
set -o noclobber

# Activar autocompletado
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# --- Starship Prompt ---
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
fi

# --- Homebrew (Linuxbrew) ---
if [ -d "$HOME/.linuxbrew" ]; then
    eval "$($HOME/.linuxbrew/bin/brew shellenv)"
elif [ -d "/home/linuxbrew/.linuxbrew" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# --- asdf Version Manager ---
if [ -f "$HOME/.asdf/asdf.sh" ]; then
    . "$HOME/.asdf/asdf.sh"
fi
if [ -f "$HOME/.asdf/completions/asdf.bash" ]; then
    . "$HOME/.asdf/completions/asdf.bash"
fi

#android home
export ANDROID_HOME=/home/luism/Android/Sdk
export PATH=$ANDROID_HOME/cmdline-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin/:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH


#android sdk root
export ANDROID_SDK_ROOT=/home/luism/Android/Sdk
export PATH=$ANDROID_SDK_ROOT:$PATH