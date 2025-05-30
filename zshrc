# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="robbyrussell"


COMPLETION_WAITING_DOTS="true"

# Enable plugins
plugins=(
    git
    docker
    sudo
    flutter
    zsh-autosuggestions
    zsh-syntax-highlighting
    fast-syntax-highlighting
    zsh-autocomplete
    brew
)

source $ZSH/oh-my-zsh.sh

# Add Homebrew to PATH if installed (Linux & macOS)
if [ -d "/home/linuxbrew/.linuxbrew/bin" ]; then
    export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
elif [ -d "/opt/homebrew/bin" ]; then
    export PATH="/opt/homebrew/bin:$PATH"
elif [ -d "/usr/local/bin/brew" ]; then
    export PATH="/usr/local/bin:$PATH"
fi

 export LANG=es_VE.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Android Studio environment variables
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# starship prompt
eval "$(starship init zsh)"

# Manual aliases
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias cat='bat'
alias rzsh='source ~/.zshrc'
alias nzsh='nvim ~/.zshrc'
alias dstart='sudo systemctl start docker'
alias dstop='sudo systemctl stop docker.socket'
alias upd='sudo dnf distro-sync -y'
alias int='sudo dnf install -y'
alias rmv='sudo dnf remove -y'