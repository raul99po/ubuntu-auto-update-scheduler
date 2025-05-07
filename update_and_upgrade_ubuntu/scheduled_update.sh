#!/bin/bash
clear
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
if ! command -v crontab >/dev/null 2>&1; then
    echo "El programa 'crontab' no está instalado."
    read -p "¿Deseas instalarlo ahora? (s/n) / Do you want to install it now? (y/n): " install_choice

    if [[ "$install_choice" =~ ^[sSyY]$ ]]; then
        echo "Instalando crontab..."
        sudo apt update && sudo apt install -y cron

        if ! command -v crontab >/dev/null 2>&1; then
            echo "❌ Error al instalar crontab. Por favor, instálalo manualmente."
            exit 1
        fi

        echo "✅ Crontab instalado correctamente."
    else
        echo "⚠️ No se puede continuar sin crontab. Saliendo del script."
        exit 1
    fi
fi

script_dir="$(cd "$(dirname "$0")" && pwd)"
cron_target="$script_dir/update_and_upgrade_ubuntu.sh"

read -p "Escoge tu idioma / Choose your language (1. Spanish 2. English): " language
sleep 1

if [[ "$language" == "1" ]]; then
    echo "✅ Vamos a programar las actualizaciones de tu servidor..."
    sleep 2
    echo "0. Domingo | 1. Lunes | 2. Martes | 3. Miércoles | 4. Jueves | 5. Viernes | 6. Sábado | * Todos los días"
    read -p "Introduce el día de la semana: " day
    sleep 1
    clear

    echo "1-12 para Enero-Diciembre | * Todos los meses"
    read -p "Introduce el mes: " month
    sleep 1
    clear

    read -p "Introduce el día del mes (1-31): " day_month
    sleep 1
    clear

    read -p "Hora (formato 24h): " hour
    sleep 1
    clear

    read -p "Minuto exacto: " minute
    clear

    cron_line="$minute $hour $day_month $month $day bash $cron_target"
    (crontab -l 2>/dev/null; echo "$cron_line") | crontab -
    echo "✅ Tarea programada exitosamente."
    sleep 2

else
    echo "✅ Let's schedule your server updates..."
    sleep 2
    echo "0. Sunday | 1. Monday | 2. Tuesday | 3. Wednesday | 4. Thursday | 5. Friday | 6. Saturday | * Every day"
    read -p "Enter the day of the week: " day
    sleep 1
    clear

    echo "1-12 for Jan-Dec | * Every month"
    read -p "Enter the month: " month
    sleep 1
    clear

    read -p "Enter the day of the month (1-31): " day_month
    sleep 1
    clear

    read -p "Hour (24h format): " hour
    sleep 1
    clear

    read -p "Exact minute: " minute
    clear

    cron_line="$minute $hour $day_month $month $day bash $cron_target"
    (crontab -l 2>/dev/null; echo "$cron_line") | crontab -
    echo "✅ Update task scheduled successfully."
    sleep 2
fi
