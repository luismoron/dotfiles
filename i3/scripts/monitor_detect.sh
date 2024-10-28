#!/bin/bash

# Rutas a los scripts de configuración de pantallas
SINGLE_MONITOR_SCRIPT="$HOME/.screenlayout/single-monitor.sh"
DUAL_MONITOR_SCRIPT="$HOME/.screenlayout/dual-monitor.sh"

# Función para aplicar la configuración de pantallas
apply_screenlayout() {
    if [ "$1" == "single" ]; then
        if [ -f "$SINGLE_MONITOR_SCRIPT" ]; then
            echo "Aplicando configuración de una sola pantalla..."
            $SINGLE_MONITOR_SCRIPT
        else
            echo "No se encontró el script de configuración de una sola pantalla."
        fi
    elif [ "$1" == "dual" ]; then
        if [ -f "$DUAL_MONITOR_SCRIPT" ]; then
            echo "Aplicando configuración de múltiples pantallas..."
            $DUAL_MONITOR_SCRIPT
        else
            echo "No se encontró el script de configuración de múltiples pantallas."
        fi
    fi
}

# Detectar cambios en los monitores
connected_monitors=$(xrandr --query | grep " connected" | wc -l)

echo "Monitores conectados: $connected_monitors"

if [ "$connected_monitors" -eq 1 ]; then
    apply_screenlayout "single"
elif [ "$connected_monitors" -gt 1 ]; then
    apply_screenlayout "dual"
else
    echo "No se detectaron monitores conectados."
fi

