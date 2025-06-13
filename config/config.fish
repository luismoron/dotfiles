if status is-interactive
    # Commands to run in interactive sessions can go here
end


# Add Go to PATH
set -gx PATH $PATH /usr/local/go/bin $HOME/go/bin


#Asdf Variable
# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims


starship init fish | source

# Add ~/.local/bin to PATH if not already present
if not contains $HOME/.local/bin $PATH
    set -gx --prepend PATH $HOME/.local/bin
end

# Add Cargo (Rust) to PATH if not already present
if not contains $HOME/.cargo/bin $PATH
    set -gx --prepend PATH $HOME/.cargo/bin
end


#alias to docker

alias d='docker'
alias dc='docker compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dr='docker run'
alias dstop='docker stop'
alias drm='docker rm'
alias dprune='docker system prune'
alias dcp='docker cp'
alias dexec='docker exec -it'
alias dlogs='docker logs -f'
alias dnetwork='docker network'
alias dvl='docker volume ls'
alias dvlrm='docker volume rm'
alias dvol='docker volume'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcrestart='docker-compose restart'
alias dcdup='docker-compose down && docker-compose up -d'


# Manual aliases
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias cat='bat'
alias rfish='source ~/.config/fish/config.fish'
alias cfish='code ~/.config/fish/config.fish'
alias dstart='sudo systemctl start docker'
alias dstop='sudo systemctl stop docker.socket'
alias upd='paru -Syu --noconfirm'
alias int='paru -S --noconfirm'
alias rmv='paru -Rc --noconfirm'

# Add Android SDK to PATH
set -gx ANDROID_HOME $HOME/Android/Sdk
set -gx PATH $PATH $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools

set -g fish_greeting ""
