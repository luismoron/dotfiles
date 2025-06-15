#!/bin/bash

# Verificar el entorno de ejecución
echo "Script ejecutado por: $(whoami)"
echo "Ruta del script: $(pwd)"

# Obtener la temperatura de la CPU
temp=$(sensors | grep 'Tctl' | awk '{print $2}' | tr -d '+°C')

# Verificar si la temperatura se obtuvo correctamente
if [ -z "$temp" ]; then
    echo "Error: No se pudo obtener la temperatura"
    exit 1
fi

# Formatear la salida para i3status
echo "CPU Temp: $temp°C"
