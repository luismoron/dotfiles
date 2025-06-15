# My Dotfiles new

# Fast Repos

## Clone This Repository

To copy these dotfiles to your system, run:

```sh
git clone --depth 1 git@github.com:luismoron/dotfiles.git ~/Plantillas/dotfiles
```

To quickly install required packages, copy and paste the following command:

```sh
paru -S i3-scrot i3exit starship
```

# Simbolyc Link

```sh
rm -rf /home/$USER/.config/i3
rm -rf /home/$USER/.config/picom
rm -rf /home/$USER/.config/rofi
rm -rf /home/$USER/.config/dunst
rm -rf /home/$USER/.profile
rm -rf /home/$USER/.gtkrc-2.0

ln -s /home/$USER/Plantillas/dotfiles/i3 /home/$USER/.config/i3
ln -s /home/$USER/Plantillas/dotfiles/rofi /home/$USER/.config
ln -s /home/$USER/Plantillas/dotfiles/picom /home/$USER/.config
ln -s /home/$USER/Plantillas/dotfiles/dunst /home/$USER/.config
ln -s /home/$USER/Plantillas/dotfiles/config/systemd /home/$USER/.config
ln -s /home/$USER/Plantillas/dotfiles/screenlayout /home/$USER/.screenlayout
ln -s /home/$USER/Plantillas/dotfiles/profile /home/$USER/.profile
ln -s /home/$USER/Plantillas/dotfiles/gtkrc-2.0 /home/$USER/.gtkrc-2.0
ln -s /home/$USER/Plantillas/dotfiles/xfce4 /home/$USER/.local/share/
```

# With sudo or ROOT

## Create Symbolic Links as Root

Use the following commands to create symbolic links. **Run as root or with `sudo`:**

```sh
ln -s /home/luism/Plantillas/dotfiles/usr/bin/bspcolorpicker /usr/bin/color-picker
ln -s /home/luism/Plantillas/dotfiles/usr/bin/i3wc.sh /usr/bin/i3wc
```
