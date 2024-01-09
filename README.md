# My Dotfiles new

# Fast Repos

#nano /etc/dnf/dnf.conf

fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True

sudo dnf install dnf5 -y;
sudo dnf groupinstall "development tools" -y;

# PACKAGE TO INSTALL

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm;
sudo dnf swap ffmpeg-free ffmpeg --allowerasing;
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin;
sudo dnf groupupdate sound-and-video;
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld;
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld;


install zsh pavucontrol scrot playerctl conky breeze-cursor-theme blueman qt5ct kvantum light  rofi neovim polkit-gnome  lightdm-slick-greeter lxappearance picom g++ clipit  xkill viewnior ninja cmake gtk3-devel clang gtk-murrine-engine gtk2-engines xclip xarchiver

   readline-devel sqlite sqlite-devel openssl-devel -y;
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo;
install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y;

# Flathub Repo

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Simbolyc Link

rm -rf /home/luism/.config/i3;
ln -s /home/luis/Plantillas/dotfiles/i3 /home/luis/.i3;
ln -s /home/luis/Plantillas/dotfiles/rofi /home/luis/.config;
ln -s /home/luis/Plantillas/dotfiles/picom /home/luis/.config;
ln -s /home/luis/Plantillas/dotfiles/dunst/ /home/luis/.config/



ln -s /home/luism/Templates/dotfiles/.dir_colors /home/luism/;
ln -s /home/luism/Templates/dotfiles/.dmenurc /home/luism/;
ln -s /home/luism/Templates/dotfiles/.profile /home/luism/;
ln -s /home/luism/Templates/dotfiles/.local/share/rofi/ /home/luism/.local/share/;
ln -s /home/luism/Templates/dotfiles/.config/dunst /home/luism/.config/;
ln -s /home/luism/Templates/dotfiles/.config/rofi /home/luism/.config/;
ln -s /home/luism/Templates/dotfiles/.Xresources /home/luism/;

# With sudo or ROOT

ln -s /home/luis/Plantillas/dotfiles/usr/bin/i3exit /usr/bin/;
ln -s /home/luis/Plantillas/dotfiles/usr/bin/blurlock /usr/bin/;
ln -s /home/luis/Plantillas/dotfiles/usr/bin/start_conky /usr/bin/;


ln -s /home/luism/Templates/dotfiles/usr/bin/blurlock /usr/bin/;
ln -s /home/luism/Templates/dotfiles/usr/bin/dmenu_recency /usr/bin/;
ln -s /home/luism/Templates/dotfiles/usr/bin/i3-scrot /usr/bin/;
ln -s /home/luism/Templates/dotfiles/usr/bin/start_conky /usr/bin/;
ln -s /home/luism/Templates/dotfiles/usr/bin/ff-theme-util /usr/bin/;
ln -s /home/luism/Templates/dotfiles/usr/bin/setcursor /usr/bin/;
ln -s /home/luism/Templates/dotfiles/usr/share/conky/ /usr/share/;
ln -s /home/luism/Templates/dotfiles/usr/share/nano-syntax-highlighting /usr/share/;
ln -s /home/luism/Templates/dotfiles/usr/share/zsh/fedora-zsh-config /usr/share/zsh/;
ln -s /home/luism/Templates/dotfiles/usr/share/zsh/fedora-zsh-prompt /usr/share/zsh/;
ln -s /home/luism/Templates/dotfiles/usr/share/zsh/p10k.zsh /usr/share/zsh/;
cp -r /home/luism/Templates/dotfiles/usr/share/fonts/TTF /usr/share/fonts;
cp -r /home/luism/Templates/dotfiles/usr/share/fonts/Roboto /usr/share/fonts;
cp -r /home/luism/Templates/dotfiles/usr/share/fonts/RobotoMono /usr/share/fonts;

# Neovim NVchad

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash;
source ~/.bashrc;
nvm install 18;
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim;

# Touch to click

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
