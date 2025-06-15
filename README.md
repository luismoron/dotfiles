# Dotfiles Personales

Este repositorio contiene mis archivos de configuración personal (dotfiles) para entornos Linux. Incluye configuraciones optimizadas para gestores de ventanas, temas, scripts y utilidades que facilitan la personalización y automatización del sistema. Es útil para restaurar rápidamente mi entorno de trabajo o replicarlo en nuevas instalaciones.

## Configuración de Repositorios DNF para descarga mas rapidas

> **Nota:**  
> Edita `/etc/dnf/dnf.conf` con nano para aplicar estas configuraciones.

```conf
fastestmirror=True           # Habilita el espejo más rápido
max_parallel_downloads=10    # Descargas paralelas máximas
defaultyes=True              # Responde 'sí' por defecto
keepcache=True               # Mantiene la caché de paquetes
```

## Instalar Paquetes Esenciales

Puedes instalar los siguientes paquetes ejecutando este comando:

```sh
sudo dnf install i3 rofi xss-lock clipit lxappearance picom xwininfo blueman xclip scrot brightnessctl
```

## Agregar Repositorio Flathub

```sh
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

## Temas: Matcha y Win11 Icons

<!-- Este comando es para que las apps de flatpak tomen el tema actual instalado -->

<details>
<summary><strong>Aplicar temas GTK y de iconos a Flatpak</strong></summary>

```sh
sudo flatpak override --filesystem=xdg-config/gtk-3.0:ro --filesystem=xdg-config/gtk-4.0:ro --filesystem=~/.themes:ro --env=GTK_THEME=Matcha-dark-azul --env=ICON_THEME=Win11-blue-dark
```

</details>

<details>
<summary><strong>Crear enlaces simbólicos (usuario)</strong></summary>

```sh
# Elimina la configuración anterior de i3
rm -rf /home/$USER/.config/i3

# Crea enlaces simbólicos para las configuraciones personalizadas
ln -s /home/$USER/Plantillas/dotfiles/i3 /home/$USER/.config/i3
ln -s /home/$USER/Plantillas/dotfiles/rofi /home/$USER/.config
ln -s /home/$USER/Plantillas/dotfiles/picom /home/$USER/.config
ln -s /home/$USER/Plantillas/dotfiles/dunst /home/$USER/.config
ln -s /home/$USER/Plantillas/dotfiles/config/systemd /home/$USER/.config
ln -s /home/$USER/Plantillas/dotfiles/screenlayout /home/$USER/.screenlayout
ln -s /home/$USER/Plantillas/dotfiles/ranger /home/$USER/.config/
ln -s /home/$USER/Plantillas/dotfiles/config/gtk-3.0/settings.ini /home/$USER/.config/gtk-3.0/
ln -s /home/$USER/Plantillas/dotfiles/i3/scripts/monitor_detect.sh /usr/bin/dmonitor
```

</details>

<details>
<summary><strong>Con sudo o ROOT</strong></summary>

```sh
# Copia la configuración del touchpad
cp /home/luism/Plantillas/dotfiles/etc/X11/30-touchpad.conf /etc/X11/xorg.conf.d/

# Crea enlaces simbólicos para scripts y utilidades
ln -s /home/luism/Plantillas/dotfiles/usr/bin/bspcolorpicker /usr/bin/color-picker
ln -s /home/luism/Plantillas/dotfiles/usr/bin/i3wc.sh /usr/bin/i3wc
ln -s /home/luism/Plantillas/dotfiles/usr/bin/power-profiles /usr/bin/power-profiles
ln -s /home/luism/Plantillas/dotfiles/usr/bin/i3exit /usr/bin/
ln -s /home/luism/Plantillas/dotfiles/usr/bin/blurlock /usr/bin/
ln -s /home/luism/Plantillas/dotfiles/usr/bin/i3-scrot /usr/bin/
```

</details>

## Verificar Navegador Web Predeterminado

```sh
xdg-settings get default-web-browser
```

## Establecer Navegador y Explorador de Archivos Predeterminados

```sh
xdg-mime default com.microsoft.EdgeDev.desktop x-scheme-handler/https x-scheme-handler/http
xdg-mime default thunar.desktop inode/directory
```

---

**Tokens útiles para configuración de ventanas en i3:**

`class`, `instance`, `window_role`, `con_id`, `id`, `window_type`, `con_mark`, `title`, `urgent`, `workspace`, `machine`, `floating_from`, `tiling_from`, `tiling`, `floating`, `all`
