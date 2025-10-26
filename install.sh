#!/bin/bash

# Script de instalación para dotfiles personales
# Este script crea enlaces simbólicos y configura el sistema.
# Ejecuta con precaución y revisa el código antes.

set -e  # Salir en caso de error

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Función para imprimir mensajes
info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Verificar si estamos en el directorio correcto
if [[ ! -f "README.md" ]] || [[ ! -d "i3" ]]; then
    error "Ejecuta este script desde la raíz del repositorio dotfiles."
    exit 1
fi

# Backup de configuraciones existentes
info "Creando backups de configuraciones existentes..."
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Backup de configuraciones de usuario
for dir in i3 rofi picom dunst ranger; do
    if [[ -d "$HOME/.config/$dir" ]]; then
        warn "Backup de $HOME/.config/$dir -> $BACKUP_DIR/$dir"
        cp -r "$HOME/.config/$dir" "$BACKUP_DIR/"
    fi
done

# Backup de screenlayout
if [[ -d "$HOME/.screenlayout" ]]; then
    warn "Backup de $HOME/.screenlayout -> $BACKUP_DIR/screenlayout"
    cp -r "$HOME/.screenlayout" "$BACKUP_DIR/"
fi

# Backup de config.fish
if [[ -f "$HOME/.config/fish/config.fish" ]]; then
    warn "Backup de $HOME/.config/fish/config.fish -> $BACKUP_DIR/config.fish"
    cp "$HOME/.config/fish/config.fish" "$BACKUP_DIR/"
fi

info "Backups creados en: $BACKUP_DIR"

# Crear enlaces simbólicos de usuario
info "Creando enlaces simbólicos de usuario..."
ln -sf "$(pwd)/i3" "$HOME/.config/i3"
ln -sf "$(pwd)/rofi" "$HOME/.config/rofi"
ln -sf "$(pwd)/picom" "$HOME/.config/picom"
ln -sf "$(pwd)/dunst" "$HOME/.config/dunst"
ln -sf "$(pwd)/ranger" "$HOME/.config/ranger"
ln -sf "$(pwd)/screenlayout" "$HOME/.screenlayout"
ln -sf "$(pwd)/config/config.fish" "$HOME/.config/fish/config.fish"

# Configuraciones que requieren sudo
info "Configuraciones que requieren privilegios (sudo)..."

# Copiar configuración del touchpad
if [[ -f "etc/X11/30-touchpad.conf" ]]; then
    info "Copiando configuración del touchpad..."
    sudo cp "etc/X11/30-touchpad.conf" /etc/X11/xorg.conf.d/
else
    warn "No se encontró etc/X11/30-touchpad.conf"
fi

# Enlaces para utilidades en /usr/bin
for bin in i3wc.sh power-profiles i3exit blurlock i3-scrot; do
    if [[ -f "usr/bin/$bin" ]]; then
        info "Enlazando $bin a /usr/bin..."
        sudo ln -sf "$(pwd)/usr/bin/$bin" "/usr/bin/$(basename "$bin" .sh)"
    else
        warn "No se encontró usr/bin/$bin"
    fi
done

# Configurar systemd de usuario (opcional)
if [[ -d "config/systemd/user" ]]; then
    info "Enlazando servicios systemd de usuario..."
    mkdir -p "$HOME/.config/systemd/user"
    for service in config/systemd/user/*.service config/systemd/user/*.target; do
        if [[ -f "$service" ]]; then
            ln -sf "$(pwd)/$service" "$HOME/.config/systemd/user/$(basename "$service")"
        fi
    done
fi

# Configurar GTK settings.ini
if [[ -f "config/gtk-3.0/settings.ini" ]]; then
    info "Enlazando configuración GTK..."
    mkdir -p "$HOME/.config/gtk-3.0"
    ln -sf "$(pwd)/config/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0/settings.ini"
fi

info "Instalación completada."
info "Reinicia tu sesión o ejecuta 'i3-msg restart' para aplicar cambios en i3."
info "Backups disponibles en: $BACKUP_DIR"