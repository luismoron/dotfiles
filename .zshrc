# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker sudo asdf flutter)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
#
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# StarShip Promtp
eval "$(starship init zsh)"

# ASDF
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit




# Manual aliases
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias cat='bat'
alias rzsh='source ~/.zshrc'
alias nzsh='nvim ~/.zshrc'
alias ni3='nvim ~/.i3/config'
alias nhyp='nvim ~/.config/hypr/hyprland.conf'
alias nkit='nvim ~/.config/kitty/kitty.conf'
alias dstart='sudo systemctl start docker'
alias dstop='sudo systemctl stop docker'
alias dp='docker ps'
alias di='docker images'
alias dp='docker pull'
alias dv='docker volume'
alias ngtk4='nvim /home/luism/.config/gtk-4.0/settings.ini'
alias ngtk='nvim /home/luism/.gtkrc-2.0'
alias update='sudo dnf update -y'
alias install='sudo dnf install -y'
alias remove='sudo dnf remove -y'

#-------------------------------------------------------------
# Git Alias Commands
#-------------------------------------------------------------
#
alias g="git status"
alias ga="git add"
alias gaa="git add ."
alias gau="git add -u"
alias gr="git restore"
alias grs="git restore --staged"
alias gc="git commit -m"
alias gca="git commit -am"
alias gb="git branch"
alias gbd="git branch -d"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gt="git stash"
alias gta="git stash apply"
alias gm="git merge"
alias gr="git rebase"
alias gl="git log --oneline --decorate --graph"
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias glga="git log --graph --oneline --all --decorate"
alias gb="git branch"
alias gs="git show"
alias gd="diff --color --color-words --abbrev"
alias gdc="git diff --cached"
alias gbl="git blame"
alias gps="git push"
alias gpl="git pull"
alias gb="git branch"
alias gc="git commit"
alias gd="git diff"
alias gk="gitk --all&"
alias gx="gitx --all"
alias nwor="nvim ~/.config/workstyle/config.toml "

# show ignored files by git
alias gx="ign = ls-files -o -i --exclude-standard"

# Untrack Files without deleting them
alias grmc="git rm -r --cached"


#-------------------------------------------------------------
# Docker Alias Commands
#-------------------------------------------------------------
#

alias dockerstart='sudo systemctl start docker'
alias dockerstatus="sudo systemctl status docker"
alias dockerstop='sudo systemctl stop docker.socket'
alias dockerstop='sudo systemctl stop docker.socket'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dp='docker pull'
alias dvl='docker volume ls'
alias dvc='docker volume create'
alias dvr='docker volume remove'


#-------------------------------------------------------------
# zerotier Alias Commands
#-------------------------------------------------------------
#

alias zostart='sudo systemctl start zerotier-one'
alias zostop='sudo systemctl stop zerotier-one'
alias zostatus='sudo systemctl status zerotier-one'


#flutter
#export FLUTTER_HOME=/home/luism/.asdf/installs/flutter/3.16.1-stable/
#export PATH=$FLUTTER_HOME/bin:$PATH

#android home
export ANDROID_HOME=/home/luism/Android/Sdk
export PATH=$ANDROID_HOME/cmdline-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin/:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH


#android sdk root
export ANDROID_SDK_ROOT=/home/luism/Android/Sdk
export PATH=$ANDROID_SDK_ROOT:$PATH

#export PATH="${PATH}:$HOME/.i3/scripts/"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Cargo Apps
# export PATH=$HOME/.asdf/installs/rust/1.75.0/bin:$PATH
