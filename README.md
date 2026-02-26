# update_and_upgrade_ubuntu

> Script en bash para programar actualizaciones automáticas en servidores Ubuntu usando crontab. Permite configurar fecha y hora desde menú interactivo y envía notificaciones vía Telegram tras la ejecución. Ideal para tareas de mantenimiento programadas.

![GitHub](https://img.shields.io/badge/Version-1.0-blue)
![License](https://img.shields.io/badge/License-MIT-green)

## 📦 Contenido

- `scheduled_update.sh`: Script interactivo para programar la tarea en `crontab`.
- `update_and_upgrade_ubuntu.sh`: Script que realiza la actualización y envía una notificación por Telegram.

## 📦 Requisitos

- Ubuntu/Debian
- `cron` instalado y en ejecución
- Conexión a internet
- Token de bot de Telegram
- ID de chat de Telegram

## 🚀 Instalación

1. Clona este repositorio o transfiere los archivos al servidor:

```bash
git clone https://github.com/raul99po/ubuntu-auto-update-scheduler.git
cd ubuntu-auto-update-scheduler/
```

2. Da permisos de ejecución:

```bash
chmod +x *.sh
```

3. Edita el script con tu BOT_TOKEN y CHAT_ID:

```bash
nano update_and_upgrade_ubuntu.sh
```
   
4. Ejecuta el script de configuración:

```bash
sudo ./scheduled_update.sh
```

## 📡 Notificación por Telegram

Para que funcione la notificación:

1. Crea un bot con [@BotFather](https://t.me/BotFather)
2. Obtén el `BOT_TOKEN`
3. Obtén tu `CHAT_ID` enviando un mensaje a tu bot y accediendo a:  
   `https://api.telegram.org/bot<BOT_TOKEN>/getUpdates`
4. Configura estos valores dentro del script `update_and_upgrade_ubuntu.sh`.

# 🛠️ Cómo obtener tu BOT_TOKEN y CHAT_ID
1. **Crear un bot con @BotFather**
  Habla con @BotFather
  Envía /newbot y sigue los pasos.
  Guarda el TOKEN que te da.

2. **Obtener tu CHAT_ID**
Habla con tu bot (envía cualquier mensaje)
Luego ve a:
https://api.telegram.org/bot<BOT_TOKEN>/getUpdates
Busca tu id en "chat":{"id":XXXXXXXX}

## 🔒 Seguridad

- Asegúrate de que el script no sea accesible públicamente.
- No compartas tu `BOT_TOKEN` ni `CHAT_ID`.
- Es recomendable guardar las claves en un archivo .env.


## 🧪Recordatorio

Recuerda introducir la siguiente línea en tu crontab:
```bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin


