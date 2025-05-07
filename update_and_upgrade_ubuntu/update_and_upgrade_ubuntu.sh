#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

BOT_TOKEN="<Introduce aquí el TOKEN de tu bot>"
CHAT_ID="<Introduce aquí el CHAT ID de tu cuenta donde deseas recibir alertas>"

if sudo apt update && sudo apt upgrade -y; then
    MESSAGE="🔄 Actualización completada exitosamente.

🖥️ Servidor: $(hostname)
🗓️ Fecha: $(date)

✅ El mantenimiento programado se ha realizado sin problemas."

    curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
         -d chat_id="$CHAT_ID" \
         -d text="$MESSAGE" >/dev/null 2>&1
else
    ERROR_MESSAGE="❌ Error en la actualización del servidor $(hostname).
🗓️ Fecha: $(date)

Por favor, revisa el sistema manualmente."

    curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
         -d chat_id="$CHAT_ID" \
         -d text="$ERROR_MESSAGE" >/dev/null 2>&1
fi
