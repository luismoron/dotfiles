# Dotfiles Personales

Configuraciones para i3-gaps, rofi, picom, dunst, ranger, fish y más.

## Requisitos

- **Fedora 40+** (adapta a tu distro cambiando `dnf` por tu gestor)
- **i3-wm** o **i3-gaps**
- **Fish** como shell

### Paquetes necesarios (Fedora 44)

```sh
# Instalar todos los paquetes de una vez
sudo dnf install \
    i3-gaps rofi picom dunst ranger clipit \
    alacritty xfce4-terminal xss-lock \
    nm-applet blueman volumeicon pasystray \
    polkit-gnome-authentication-agent-1 \
    scrot brightnessctl feh ImageMagick \
    fish fzf ripgrep fd-find eza bat \
    lxappearance xfce4-notifyd \
    playerctl i3status conky redshift \
    xdotool xprop xkill udiskie \
    zathura zathura-pdf-poppler \
    ffmpegthumbnailer highlight atool w3m img2txt
```

## Instalación

### 1. Clonar el repositorio

```sh
git clone https://github.com/tu-user/dotfiles ~/Plantillas/dotfiles
cd ~/Plantillas/dotfiles
```

### 2. Ejecutar el script de instalación

```sh
./install.sh
```

El script:
- Crea backups de tus configs actuales
- Genera enlaces simbólicos en `~/.config/`
- Enlaza scripts a `/usr/bin/`
- Copia configuración del touchpad a `/etc/X11/`

### 3. Post-instalación

```sh
# Reiniciar i3 para aplicar cambios
i3-msg restart

# O cerrar sesión y volver a entrar
```

## Estructura del repositorio

```
dotfiles/
├── config/
│   ├── config.fish          # Config de fish shell
│   ├── gtk-3.0/settings.ini # Tema GTK3
│   └── systemd/user/        # Servicios de usuario (i3-session, workstyle)
├── dunst/                   # Notificaciones
├── i3/
│   ├── config               # Config principal de i3
│   └── scripts/
│       └── monitor_detect.sh # Auto-detección de monitores
├── picom/                   # Compositor
├── ranger/                  # Gestor de archivos terminal
├── rofi/                    # Lanzador de aplicaciones
├── screenlayout/            # Scripts xrandr para monitores
│   ├── single-monitor.sh
│   ├── dual-monitor.sh
│   └── dual-monitor-right.sh
├── usr/bin/                 # Scripts utilitarios
│   ├── blurlock             # Bloqueo de pantalla con blur
│   ├── i3exit               # Apagar/reiniciar/suspender/hibernar
│   ├── i3-scrot            # Capturas de pantalla
│   ├── power-profiles       # Cambiar perfil de energía
│   └── start_conky          # Lanzar conky
└── install.sh               # Script de instalación
```

## Atajos de teclado principales

| Atajo | Acción |
|-------|--------|
| `Super + Enter` | Terminal drop-down (xfce4-terminal) |
| `Super + Shift + Enter` | Terminal completo (xfce4-terminal) |
| `Super + d` | Menú dmenu |
| `Super + Shift + d` | Menú rofi |
| `Super + 9` | Bloquear pantalla |
| `Super + 0` | Menú de apagado (lock/logout/suspend/hibernate/reboot/shutdown) |
| `Super + 1-8` | Cambiar a espacio de trabajo |
| `Super + Shift + 1-8` | Mover ventana a espacio de trabajo |
| `Super + f` | Pantalla completa |
| `Super + Shift + f` | Cambiar a modo flotante |
| `Super + r` | Modo redimensionar |
| `Super + Shift + c` | Recargar config de i3 |
| `Super + Shift + r` | Reiniciar i3 |
| `Super + t` | Matar picom (compositor) |
| `Super + Ctrl + t` | Iniciar picom |
| `Super + Ctrl + r` | Cambiar temperatura de color (redshift) |

### Audio y brillo

| Atajo | Acción |
|-------|--------|
| `Super + Ctrl + m` | Abrir pavucontrol |
| `XF86AudioRaiseVolume` | Subir volumen |
| `XF86AudioLowerVolume` | Bajar volumen |
| `XF86AudioMute` | Silenciar |
| `XF86MonBrightnessUp` | Subir brillo |
| `XF86MonBrightnessDown` | Bajar brillo |
| `XF86AudioPlay/Pause/Next/Prev` | Control de medios |

## Configuración de pantallas

Los scripts en `screenlayout/` manejan la resolución:

```sh
~/.screenlayout/single-monitor.sh      # Solo eDP (1920x1080)
~/.screenlayout/dual-monitor.sh        # eDP + HDMI-A-0 (izquierda)
~/.screenlayout/dual-monitor-right.sh # eDP + HDMI-A-0 (derecha)
```

Se ejecutan automáticamente al iniciar i3 mediante `monitor_detect.sh`, que detecta cuántos monitores hay conectados.

Para cambiar manualmente:
```sh
~/.screenlayout/dual-monitor.sh
```

## Aplicaciones flotantes automáticas

i3 abre automáticamente en modo flotante: Spotify, Telegram, Discord, Pavucontrol, Nitrogen, GParted, etc. Ver el archivo `i3/config` sección `### Ventanas flotantes ###` para editar.

## Configurar tema y apariencia

### GTK

```sh
lxappearance
# Selecciona tema: Matcha-dark-azul
# Selecciona iconos: Win11-blue-dark
```

### Iconos para Flatpak

```sh
flatpak override \
    --filesystem=xdg-config/gtk-3.0:ro \
    --filesystem=xdg-config/gtk-4.0:ro \
    --filesystem=$HOME/.themes:ro \
    --env=GTK_THEME=Matcha-dark-azul \
    --env=ICON_THEME=Win11-blue-dark
```

### Fondo de pantalla

```sh
nitrogen /ruta/a/tu/imagen.jpg
# o simplemente coloca una imagen en ~/.fehbg
feh --bg-fill ~/.config/wallpaper.jpg
```

## Desinstalar

```sh
# Eliminar enlaces simbólicos
rm ~/.config/i3 ~/.config/rofi ~/.config/picom ~/.config/dunst
rm ~/.config/ranger ~/.screenlayout ~/.config/fish/config.fish
rm ~/.config/systemd/user/i3-session.service
rm ~/.config/systemd/user/i3-session.target
rm ~/.config/systemd/user/workstyle.service

# Restaurar desde backup
# Los backups están en ~/dotfiles_backup_YYYYMMDD_HHMMSS/
```

## Notas

- El script `install.sh` **no instala paquetes**. Solo crea enlaces simbólicos.
- Los backups se guardan en `~/dotfiles_backup_TIMESTAMP/`
- Algunos enlaces a `/usr/bin/` requieren `sudo`
- La configuración del touchpad se copia a `/etc/X11/xorg.conf.d/`

## Licencia

MIT © Luis M.
