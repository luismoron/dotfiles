# My Dotfiles new

# Fast Repos

#nano /etc/dnf/dnf.conf

#fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True

sudo dnf install dnf5 -y;
sudo dnf groupinstall "development tools" -y;

# PACKAGE TO INSTALL

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm;
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y;
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y;
sudo dnf groupupdate sound-and-video -y;
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld -y;
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld -y;


install zsh pavucontrol scrot playerctl conky breeze-cursor-theme blueman qt5ct kvantum rofi neovim polkit-gnome  lightdm-slick-greeter lxappearance picom clipit xkill viewnior ninja-build cmake  clang  xclip xarchiver thunar-archive-plugins thunar-volman thunar-media-tags

# Flathub Repo

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Theme Matcha and Win11 icons 

cd /home/luism/Templates/dotfiles/usr/share/themes/;
./install.sh -t azul;
cd /home/luism/Templates/dotfiles/usr/share/icons/;
./install.sh -blue;


# Simbolyc Link

rm -rf /home/$USER/.config/i3; <br/>
ln -s /home/$USER/Plantillas/dotfiles/i3 /home/$USER/.i3;
ln -s /home/$USER/Plantillas/dotfiles/rofi /home/$USER/.config;
ln -s /home/$USER/Plantillas/dotfiles/picom /home/$USER/.config;
ln -s /home/$USER/Plantillas/dotfiles/dunst /home/$USER/.config/;
ln -s /home/$USER/Plantillas/dotfiles/.zshrc /home/$USER/;
ln -s /home/$USER/Plantillas/dotfiles/.zprofile /home/$USER/;
ln -s /home/$USER/Plantillas/dotfiles/.config/systemd /home/$USER/.config;
ln -s /home/$USER/Plantillas/dotfiles/.screenlayout/ /home/$USER/;
ln -s /home/$USER/Plantillas/dotfiles/ranger /home/$USER/.config/;



# With sudo or ROOT

cp /home/luism/Plantillas/dotfiles/etc/X11/30-touchpad.conf /etc/X11/xorg.conf.d/;
ln -s /home/luism/Plantillas/dotfiles/usr/bin/bspcolorpicker /usr/bin/color-picker;
ln -s /home/luism/Plantillas/dotfiles/usr/bin/power-profiles /usr/bin/power-profiles;
ln -s /home/luism/Plantillas/dotfiles/usr/bin/i3wc.sh /usr/bin/i3wc;
ln -s /home/luism/Plantillas/dotfiles/usr/bin/i3exit /usr/bin/;
ln -s /home/luism/Plantillas/dotfiles/usr/bin/blurlock /usr/bin/;
ln -s /home/luism/Plantillas/dotfiles/usr/bin/i3-scrot /usr/bin/;



# Neovim NVchad

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim;

# Verifications web Browser 

xdg-settings get default-web-browser

# Set Default Browser

xdg-mime default com.microsoft.EdgeDev.desktop x-scheme-handler/https x-scheme-handler/http
xdg-mime default thunar.desktop inode/directory

tokens: 'class', 'instance', 'window_role', 'con_id', 'id', 'window_type', 'con_mark', 'title', 'urgent', 'workspace', 'machine', 'floating_from', 'tiling_from', 'tiling', 'floating', 'all', ']'
