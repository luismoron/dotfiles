# Dotfiles de Luism

# DNF mas Rapido

#fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True

Este repositorio contiene mis archivos de configuración ("dotfiles") para personalizar y automatizar la configuración de mi entorno de escritorio en Linux. Incluye configuraciones para i3, ranger, rofi, picom, dunst, conky, scripts de pantalla, y más.

## Estructura del repositorio

- **i3/**: Configuración del gestor de ventanas i3 y scripts asociados.
- **i3status/**: Configuración de la barra de estado i3status.
- **ranger/**: Configuración y plugins para el gestor de archivos ranger.
- **rofi/**: Temas y configuraciones para el lanzador rofi.
- **picom/**: Configuración del compositor picom.
- **dunst/**: Configuración del sistema de notificaciones dunst.
- **.screenlayout/** y **screenlayout/**: Scripts para la gestión de monitores.
- **usr/bin/**: Scripts personalizados para utilidades del sistema.
- **usr/share/conky/**: Configuraciones para conky.
- **etc/**: Archivos de configuración para X11 y lightdm.
- **backuorm.md**: Guía paso a paso para instalar y enlazar los dotfiles.

## Instalación rápida

1. **Clona el repositorio:**
   ```sh
   git clone https://github.com/tuusuario/dotfiles.git ~/Plantillas/dotfiles
   ```

##

# Simbolyc Link

rm -rf /home/$USER/.config/i3  
ln -s /home/$USER/Plantillas/dotfiles/i3 /home/$USER/.i3  
ln -s /home/$USER/Plantillas/dotfiles/rofi /home/$USER/.config  
ln -s /home/$USER/Plantillas/dotfiles/picom /home/$USER/.config 
ln -s /home/$USER/Plantillas/dotfiles/dunst /home/$USER/.config 
ln -s /home/$USER/Plantillas/dotfiles/.config/systemd /home/$USER/.config 
ln -s /home/$USER/Plantillas/dotfiles/.screenlayout/ /home/$USER 
ln -s /home/$USER/Plantillas/dotfiles/ranger /home/$USER/.config
ln -s /home/$USER/Plantillas/dotfiles/.zshrc /home/$USER 
ln -s /home/$USER/Plantillas/dotfiles/.zprofile /home/$USER 
ln -s /home/$USER/Plantillas/dotfiles/usr/share/fonts /home/$USER/.local/share/

# With sudo or ROOT

cp /home/luism/Plantillas/dotfiles/etc/X11/30-touchpad.conf /etc/X11/xorg.conf.d/;
ln -s /home/luism/Plantillas/dotfiles/usr/bin/bspcolorpicker /usr/bin/color-picker;
ln -s /home/luism/Plantillas/dotfiles/usr/bin/i3wc.sh /usr/bin/i3wc;
ln -s /home/luism/Plantillas/dotfiles/usr/bin/power-profiles /usr/bin/power-profiles;
ln -s /home/luism/Plantillas/dotfiles/usr/bin/i3exit /usr/bin/;
ln -s /home/luism/Plantillas/dotfiles/usr/bin/blurlock /usr/bin/;
ln -s /home/luism/Plantillas/dotfiles/usr/bin/i3-scrot /usr/bin/;

# Verifications web Browser

xdg-settings get default-web-browser

# Set Default Browser

xdg-mime default com.microsoft.EdgeDev.desktop x-scheme-handler/https x-scheme-handler/http
xdg-mime default thunar.desktop inode/directory

tokens: 'class', 'instance', 'window_role', 'con_id', 'id', 'window_type', 'con_mark', 'title', 'urgent', 'workspace', 'machine', 'floating_from', 'tiling_from', 'tiling', 'floating', 'all', ']'
