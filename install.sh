#!/bin/bash

# Script de instalación para dotfiles personales
# Este script crea enlaces simbólicos y configura el sistema.
# Ejecuta desde la raíz del repositorio: ./install.sh

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Verificar que estamos en el directorio correcto
if [[ ! -f "$REPO_DIR/README.md" ]] || [[ ! -d "$REPO_DIR/i3" ]]; then
    error "Ejecuta este script desde la raíz del repositorio dotfiles."
    exit 1
fi

info "Instalando dotfiles desde: $REPO_DIR"

# Crear directorio de backup
mkdir -p "$BACKUP_DIR"
info "Backups se guardarán en: $BACKUP_DIR"

# ============================
# 1. Backup de configs existentes
# ============================
info "Respaldando configuraciones existentes..."

backup_config() {
    local src="$1"
    local dest="$2"
    if [[ -e "$src" ]]; then
        warn "Backup: $src -> $dest"
        cp -r "$src" "$dest"
    fi
}

backup_config "$HOME/.config/i3" "$BACKUP_DIR/config_i3"
backup_config "$HOME/.config/rofi" "$BACKUP_DIR/config_rofi"
backup_config "$HOME/.config/picom" "$BACKUP_DIR/config_picom"
backup_config "$HOME/.config/dunst" "$BACKUP_DIR/config_dunst"
backup_config "$HOME/.config/ranger" "$BACKUP_DIR/config_ranger"
backup_config "$HOME/.screenlayout" "$BACKUP_DIR/screenlayout"
backup_config "$HOME/.config/fish/config.fish" "$BACKUP_DIR/config_fish"
backup_config "$HOME/.config/systemd/user" "$BACKUP_DIR/systemd_user"
backup_config "$HOME/.config/gtk-3.0/settings.ini" "$BACKUP_DIR/gtk3_settings"

# ============================
# 2. Crear directorios necesarios
# ============================
info "Creando directorios..."
mkdir -p "$HOME/.config/i3"
mkdir -p "$HOME/.config/rofi"
mkdir -p "$HOME/.config/picom"
mkdir -p "$HOME/.config/dunst"
mkdir -p "$HOME/.config/ranger"
mkdir -p "$HOME/.screenlayout"
mkdir -p "$HOME/.config/fish"
mkdir -p "$HOME/.config/systemd/user"
mkdir -p "$HOME/.config/gtk-3.0"
mkdir -p "$HOME/.config/alacritty"

# ============================
# 2.5. Configurar tema de iconos global
# ============================
info "Configurando tema de iconos..."
echo 'gtk-icon-theme-name="Win11-blue-dark"' > "$HOME/.gtkrc-2.0.mine"
dconf write /org/gnome/desktop/interface/icon-theme "'Win11-blue-dark'" 2>/dev/null || true

# ============================
# 3. Enlaces simbólicos de usuario (.config)
# ============================
info "Creando enlaces simbólicos en ~/.config/..."

rm -rf "$HOME/.config/i3" "$HOME/.config/rofi" "$HOME/.config/picom" \
       "$HOME/.config/dunst" "$HOME/.config/ranger" "$HOME/.screenlayout" \
       "$HOME/.config/fish/config.fish" "$HOME/.config/gtk-3.0/settings.ini" \
       "$HOME/.config/alacritty/alacritty.toml"

ln -nsf "$REPO_DIR/i3" "$HOME/.config/i3"
ln -nsf "$REPO_DIR/rofi" "$HOME/.config/rofi"
ln -nsf "$REPO_DIR/picom" "$HOME/.config/picom"
ln -nsf "$REPO_DIR/dunst" "$HOME/.config/dunst"
ln -nsf "$REPO_DIR/ranger" "$HOME/.config/ranger"
ln -nsf "$REPO_DIR/screenlayout" "$HOME/.screenlayout"
ln -nsf "$REPO_DIR/config/config.fish" "$HOME/.config/fish/config.fish"
ln -nsf "$REPO_DIR/config/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0/settings.ini"
ln -nsf "$REPO_DIR/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

# ============================
# 4. Servicios systemd de usuario
# ============================
if [[ -d "$REPO_DIR/config/systemd/user" ]]; then
    info "Enlazando servicios systemd de usuario..."
    rm -rf "$HOME/.config/systemd/user/"*.service "$HOME/.config/systemd/user/"*.target 2>/dev/null || true
    for service in "$REPO_DIR/config/systemd/user/"*.service "$REPO_DIR/config/systemd/user/"*.target; do
        if [[ -f "$service" ]]; then
            name=$(basename "$service")
            ln -nsf "$service" "$HOME/.config/systemd/user/$name"
            info "  - $name"
        fi
    done
fi

# ============================
# 5. Scripts en /usr/bin (requiere sudo)
# ============================
info "Enlazando scripts a /usr/bin (requiere contraseña de sudo)..."

usr_bins=(
    "i3exit"
    "blurlock"
    "i3-scrot"
    "i3wc.sh"
    "power-profiles"
    "start_conky"
    "bspcolorpicker"
)

for bin in "${usr_bins[@]}"; do
    if [[ -f "$REPO_DIR/usr/bin/$bin" ]]; then
        target_name="${bin%.sh}"
        sudo ln -nsf "$REPO_DIR/usr/bin/$bin" "/usr/bin/$target_name"
        info "  - /usr/bin/$target_name"
    else
        warn "  - No encontrado: usr/bin/$bin"
    fi
done

# ============================
# 6. Touchpad (requiere sudo)
# ============================
if [[ -f "$REPO_DIR/etc/X11/30-touchpad.conf" ]]; then
    info "Copiando configuración del touchpad..."
    sudo cp "$REPO_DIR/etc/X11/30-touchpad.conf" /etc/X11/xorg.conf.d/30-touchpad.conf
fi

# ============================
# 7. Polkit rules para udisks2 (requiere sudo)
# ============================
if [[ -f "$REPO_DIR/etc/polkit-1/rules.d/80-udisks2-wheel.rules" ]]; then
    info "Instalando reglas de Polkit para udisks2..."
    sudo cp "$REPO_DIR/etc/polkit-1/rules.d/80-udisks2-wheel.rules" /etc/polkit-1/rules.d/80-udisks2-wheel.rules
fi

# ============================
# 8. Verificar instalación
# ============================
info "Verificando enlaces..."

verify_link() {
    if [[ -L "$1" ]]; then
        info "  ✓ $1"
    else
        warn "  ✗ $1 (no es un enlace simbólico)"
    fi
}

verify_link "$HOME/.config/i3"
verify_link "$HOME/.config/rofi"
verify_link "$HOME/.config/picom"
verify_link "$HOME/.config/dunst"
verify_link "$HOME/.config/ranger"
verify_link "$HOME/.screenlayout"
verify_link "$HOME/.config/fish/config.fish"

# ============================
# 8. Instrucciones finales
# ============================
echo ""
info "=========================================="
info " Instalación completada"
info "=========================================="
echo ""
echo " Paquetes necesarios (Fedora 44):"
echo "   sudo dnf install i3-gaps rofi picom dunst ranger clipit"
echo "   sudo dnf install alacritty xfce4-terminal xss-lock"
echo "   sudo dnf install nm-applet blueman volumeicon pasystray"
echo "   sudo dnf install polkit-gnome-authentication-agent-1"
echo "   sudo dnf install scrot brightnessctl feh imagemagick"
echo "   sudo dnf install fish fzf ripgrep fd-find eza bat"
echo "   sudo dnf install lxappearance xfce4-notifyd"
echo "   sudo dnf install playerctl i3status conky redshift"
echo "   sudo dnf install xdotool xprop xkill udiskie"
echo "   sudo dnf install zathura zathura-pdf-poppler"
echo "   sudo dnf install ffmpegthumbnailer highlight atool w3m img2txt"
echo ""
echo " Para aplicar cambios sin reiniciar:"
echo "   i3-msg restart"
echo ""
echo " Backups en: $BACKUP_DIR"
echo ""
