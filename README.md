# My Dotfiles new

# Fast Repos

# Nano /etc/dnf/dnf.conf

#fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True

# Flathub Repo

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Theme Matcha and Win11 icons 


# Simbolyc Link

rm -rf /home/$USER/.config/i3
rm -rf /home/$USER/.config/picom
rm -rf /home/$USER/.config/rofi
rm -rf /home/$USER/.config/dunst
rm -rf /home/$USER/.profile
rm -rf /home/$USER/.gtkr-2.0
ln -s /home/$USER/Plantillas/dotfiles/i3 /home/$USER/.config/i3  
ln -s /home/$USER/Plantillas/dotfiles/rofi /home/$USER/.config  
ln -s /home/$USER/Plantillas/dotfiles/picom /home/$USER/.config 
ln -s /home/$USER/Plantillas/dotfiles/dunst /home/$USER/.config 
ln -s /home/$USER/Plantillas/dotfiles/config/systemd /home/$USER/.config 
ln -s /home/$USER/Plantillas/dotfiles/screenlayout /home/$USER/.screenlayout
ln -s /home/$USER/Plantillas/dotfiles/profile /home/$USER/.profile
ln -s /home/$USER/Plantillas/dotfiles/gtkrc-2.0 /home/$USER/.gtkrc-2.0


# With sudo or ROOT

cp /home/luism/Plantillas/dotfiles/etc/X11/30-touchpad.conf /etc/X11/xorg.conf.d/;
ln -s /home/luism/Plantillas/dotfiles/usr/bin/bspcolorpicker /usr/bin/color-picker;
ln -s /home/luism/Plantillas/dotfiles/usr/bin/i3wc.sh /usr/bin/i3wc;
ln -s /home/luism/Plantillas/dotfiles/usr/bin/power-profiles /usr/bin/power-profiles;
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