# My Dotfiles new

# Fast Repos

#nano /etc/dnf/dnf.conf

fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True

sudo dnf groupinstall "development tools" -y;
sudo dnf install dnf5 -y;

# OH-MY-BASH

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
 
rm ~/.bashrc;
ln -s /home/luism/dotfiles/.bashrc /home/luism/;
update -y; 

# PACKAGE TO INSTALL

install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y;
install  playerctl conky breeze-cursor-theme system-config-printer blueman cargo hplip rxvt-unicode light nitrogen rofi polkit-gnome neovim lightdm-slick-greeter qt5ct lxappearance bat lsd file-roller picom g++ clipit  xkill viewnior ninja cmake gtk3-devel clang gtk-murrine-engine gtk2-engines xclip xarchiver zsh-autosuggestions zsh zsh-syntax-highlighting xautolock redshift  udiskie sqlite unrar p7zip redshift thunar-media-tags-plugin thunar-vcs-plugin thunar-archive-plugin thunar-sendto-clamtk  -y;
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo;
install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y;

# FLATPAK TO FLATHUB REPO

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Theme Matcha and Win11 icons 

git clone https://github.com/vinceliuice/Matcha-gtk-theme.git;
cd Matcha-gtk-theme;
./install.sh -t azul;
cd ~;
git clone https://github.com/yeyushengfan258/Win11-icon-theme.git;
cd Win11-icon-theme;
./install.sh -blue;


# Simbolyc Link

rm -rf /home/luism/.config/i3;
ln -s /home/luism/dotfiles/.config/i3 /home/luism/.config/;
ln -s /home/luism/dotfiles/.config/i3status /home/luism/.config/;
ln -s /home/luism/dotfiles/.config/picom /home/luism/.config/;
ln -s /home/luism/dotfiles/.zshrc /home/luism/;
ln -s /home/luism/dotfiles/.dir_colors /home/luism/;
ln -s /home/luism/dotfiles/.nanorc /home/luism/;
ln -s /home/luism/dotfiles/.dmenurc /home/luism/;
ln -s /home/luism/dotfiles/.profile /home/luism/;
ln -s /home/luism/dotfiles/.local/share/rofi/ /home/luism/.local/share/;
ln -s /home/luism/dotfiles/.config/dunst /home/luism/.config/;
ln -s /home/luism/dotfiles/.config/rofi /home/luism/.config/;
ln -s /home/luism/dotfiles/.Xresources /home/luism/;

# With sudo or ROOT

ln -s /home/luism/dotfiles/usr/bin/dmenu_recency /usr/bin/;
ln -s /home/luism/dotfiles/usr/bin/i3exit /usr/bin/;
ln -s /home/luism/dotfiles/usr/bin/i3-scrot /usr/bin/;
ln -s /home/luism/dotfiles/usr/bin/start_conky /usr/bin/;
ln -s /home/luism/dotfiles/usr/bin/ff-theme-util /usr/bin/;
ln -s /home/luism/dotfiles/usr/bin/blurlock /usr/bin/;
ln -s /home/luism/dotfiles/usr/bin/setcursor /usr/bin/;
ln -s /home/luism/dotfiles/usr/share/conky/ /usr/share/;
ln -s /home/luism/dotfiles/usr/share/nano-syntax-highlighting /usr/share/;
ln -s /home/luism/dotfiles/usr/share/zsh/fedora-zsh-config /usr/share/zsh/;
ln -s /home/luism/dotfiles/usr/share/zsh/fedora-zsh-prompt /usr/share/zsh/;
ln -s /home/luism/dotfiles/usr/share/zsh/p10k.zsh /usr/share/zsh/;
cp -r /home/luism/dotfiles/usr/share/fonts/TTF /usr/share/fonts;
cp -r /home/luism/dotfiles/usr/share/fonts/Roboto /usr/share/fonts;
cp -r /home/luism/dotfiles/usr/share/fonts/RobotoMono /usr/share/fonts;

# Plugin Neovim zsh-history-substring-search

mkdir -p /usr/share/zsh/plugins;
cd /usr/share/zsh/plugins;
git clone https://github.com/zsh-users/zsh-history-substring-search;
mkdir /usr/share/zsh/plugins/zsh-sudo;
cd /usr/share/zsh/plugins/zsh-sudo;
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
cd /usr/share;
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /usr/share/zsh-theme-powerlevel10k

# Neovim NVchad

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash;
nvm install 18;
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim;

# TOUCH TO CLICK

nano /etc/X11/xorg.conf.d/30-touchpad.conf
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "TappingButtonMap" "lmr"
EndSection

# Verifications web Browser 

xdg-settings get default-web-browser

# Set Default Browser

xdg-mime default com.microsoft.EdgeDev.desktop x-scheme-handler/https x-scheme-handler/http 

tokens: 'class', 'instance', 'window_role', 'con_id', 'id', 'window_type', 'con_mark', 'title', 'urgent', 'workspace', 'machine', 'floating_from', 'tiling_from', 'tiling', 'floating', 'all', ']'
