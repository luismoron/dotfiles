# My Dotfiles new

# Fast Repos

# Nano /etc/dnf/dnf.conf

\*\*```conf
fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True

````**

# Flathub Repo

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Theme Matcha and Win11 icons

<details>
<summary><strong>Simbolyc Link</strong></summary>

```sh
rm -rf /home/$USER/.config/i3
ln -s /home/$USER/Plantillas/dotfiles/i3 /home/$USER/.config/i3
ln -s /home/$USER/Plantillas/dotfiles/rofi /home/$USER/.config
ln -s /home/$USER/Plantillas/dotfiles/picom /home/$USER/.config
ln -s /home/$USER/Plantillas/dotfiles/dunst /home/$USER/.config
ln -s /home/$USER/Plantillas/dotfiles/config/systemd /home/$USER/.config
ln -s /home/$USER/Plantillas/dotfiles/screenlayout /home/$USER/.screenlayout
ln -s /home/$USER/Plantillas/dotfiles/ranger /home/$USER/.config/
ln -s /home/$USER/Plantillas/dotfiles/config/gtk-3.0/settings.ini /home/$USER/.config/gtk-3.0/
ln -s /home/$USER/Plantillas/dotfiles/i3/scripts/monitor_detect.sh /usr/bin/dmonitor
````

</details>

<details>
<summary><strong>With sudo or ROOT</strong></summary>

```sh
cp /home/luism/Plantillas/dotfiles/etc/X11/30-touchpad.conf /etc/X11/xorg.conf.d/
ln -s /home/luism/Plantillas/dotfiles/usr/bin/bspcolorpicker /usr/bin/color-picker
ln -s /home/luism/Plantillas/dotfiles/usr/bin/i3wc.sh /usr/bin/i3wc
ln -s /home/luism/Plantillas/dotfiles/usr/bin/power-profiles /usr/bin/power-profiles
ln -s /home/luism/Plantillas/dotfiles/usr/bin/i3exit /usr/bin/
ln -s /home/luism/Plantillas/dotfiles/usr/bin/blurlock /usr/bin/
ln -s /home/luism/Plantillas/dotfiles/usr/bin/i3-scrot /usr/bin/
```

</details>

# Verifications web Browser

xdg-settings get default-web-browser

# Set Default Browser

xdg-mime default com.microsoft.EdgeDev.desktop x-scheme-handler/https x-scheme-handler/http
xdg-mime default thunar.desktop inode/directory

tokens: 'class', 'instance', 'window_role', 'con_id', 'id', 'window_type', 'con_mark', 'title', 'urgent', 'workspace', 'machine', 'floating_from', 'tiling_from', 'tiling', 'floating', 'all', ']'
