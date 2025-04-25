# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh
#source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
#source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/cachyos-zsh-config/cachyos-config.zsh


# You may need to manually set your language environment
#
 export LANG=es_VE.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
 export ARCHFLAGS="-arch x86_64"

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
alias ni3='nvim ~/.config/i3/config'
alias dstart='sudo systemctl start docker'
alias dstop='sudo systemctl stop docker.socket'
alias upd='paru -Syu --noconfirm'
alias int='paru -S --noconfirm'
alias rmv='paru -Rc --noconfirm'

#android home
export ANDROID_HOME=/home/luism/Android/Sdk
export PATH=$ANDROID_HOME/cmdline-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin/:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH


#android sdk root
export ANDROID_SDK_ROOT=/home/luism/Android/Sdk
export PATH=$ANDROID_SDK_ROOT:$PATH

