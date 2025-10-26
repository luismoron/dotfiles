# Dotfiles personales

Repositorio con mis configuraciones (dotfiles) para entornos Linux. Está pensado para
restaurar o replicar mi entorno de trabajo en nuevas instalaciones.

## Tabla de contenido

- [Descripción](#descripción)
- [Requisitos](#requisitos)
- [Instalación rápida](#instalación-rápida)
- [Ejemplos útiles](#ejemplos-útiles)
- [Estructura del repositorio](#estructura-del-repositorio)
- [Notas importantes](#notas-importantes)
- [Contribuir](#contribuir)
- [Licencia](#licencia)

## Descripción

Contiene configuraciones y scripts para:

- i3, rofi, picom, dunst y otros componentes del entorno gráfico.
- Temas GTK / iconos y ajustes para aplicaciones Flatpak.
- Scripts de utilidad y binarios en `usr/bin`.

Usa este repositorio como plantilla personal o fuente de referencia. Sustituye rutas con `$HOME` cuando corresponda.

## Requisitos

- Sistema Linux con DNF (o adapta los comandos a tu gestor de paquetes).
- flatpak (opcional, para temas en apps sandboxed).

## Instalación rápida

Recomendación: revisa cada comando antes de ejecutarlo. Sustituye `/home/luism` por `$HOME` si lo vas a usar en otra cuenta.

### Opción automática (recomendada)

Ejecuta el script de instalación incluido:

```sh
./install.sh
```

Este script hace backup de tus configuraciones existentes y crea los enlaces simbólicos automáticamente.

### Instalación manual

- Clona el repositorio (si no lo tienes local):

```sh
git clone <tu-repo> ~/Plantillas/dotfiles
```

- Crear enlaces simbólicos (usuario):

```sh
# Elimina config previa si es necesario
rm -rf "$HOME/.config/i3"

# Enlaza configuraciones
ln -s "$HOME/Plantillas/dotfiles/i3" "$HOME/.config/i3"
ln -s "$HOME/Plantillas/dotfiles/rofi" "$HOME/.config/rofi"
ln -s "$HOME/Plantillas/dotfiles/picom" "$HOME/.config/picom"
ln -s "$HOME/Plantillas/dotfiles/dunst" "$HOME/.config/dunst"
ln -s "$HOME/Plantillas/dotfiles/ranger" "$HOME/.config/ranger"
ln -s "$HOME/Plantillas/dotfiles/screenlayout" "$HOME/.screenlayout"
ln -s "$HOME/Plantillas/dotfiles/config/config.fish" "$HOME/.config/fish/config.fish"
```

- Operaciones que requieren privilegios (con sudo):

```sh
# Copiar configuración del touchpad al sistema
sudo cp "$HOME/Plantillas/dotfiles/etc/X11/30-touchpad.conf" /etc/X11/xorg.conf.d/

# Enlaces para utilidades del sistema
sudo ln -s "$HOME/Plantillas/dotfiles/usr/bin/i3wc.sh" /usr/bin/i3wc
sudo ln -s "$HOME/Plantillas/dotfiles/usr/bin/power-profiles" /usr/bin/power-profiles
# Añade más enlaces según necesites
```

## Ejemplos útiles

Instalar paquetes (ejemplo para Fedora/DNF):

```sh
sudo dnf install i3 rofi xss-lock clipit lxappearance picom xwininfo blueman xclip scrot brightnessctl
```

Agregar Flathub:

```sh
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

Aplicar tema GTK / iconos a aplicaciones Flatpak (ejemplo):

```sh
sudo flatpak override \
  --filesystem=xdg-config/gtk-3.0:ro \
  --filesystem=xdg-config/gtk-4.0:ro \
  --filesystem=$HOME/.themes:ro \
  --env=GTK_THEME=Matcha-dark-azul \
  --env=ICON_THEME=Win11-blue-dark
```

Verificar navegador por defecto:

```sh
xdg-settings get default-web-browser
```

Establecer navegador y explorador de archivos por defecto:

```sh
xdg-mime default com.microsoft.EdgeDev.desktop x-scheme-handler/https x-scheme-handler/http
xdg-mime default thunar.desktop inode/directory
```

## Estructura del repositorio

Aquí se listan las carpetas principales y su propósito resumido:

- `config/` — configuraciones generales (fish, gtk, systemd de usuario, etc.)
- `i3/` — configuración y scripts para i3
- `rofi/` — temas y configuraciones de rofi
- `picom/` — configuración de compositor
- `dunst/` — configuración de notificaciones
- `ranger/` — configuración, comandos y plugins para ranger
- `usr/bin/` — scripts/binaries personalizados
- `screenlayout/` — scripts para disposición de monitores

Revisa cada carpeta para ver ejemplos y personalizar según tu sistema.

## Notas importantes

- Reemplaza rutas absolutas (por ejemplo `/home/luism`) por `$HOME` para portar las configuraciones.
- Haz backup antes de sobrescribir configuraciones existentes.
- Algunos enlaces a `/usr/bin` requieren privilegios y deben hacerse con `sudo`.

## Contribuir

Si quieres proponer mejoras o correcciones:

1. Haz fork del repositorio.
1. Crea una rama con tu cambio.
1. Abre un pull request con una descripción clara.

## Licencia

Este repositorio está bajo la Licencia MIT. Consulta el archivo `LICENSE` para más detalles.
