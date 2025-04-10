#!/bin/bash
# Configuración
ORIGEN="/mnt/c/Users/jhosb/Documents/Proyecto-Sincronizacion-SO"
DESTINO="/mnt/c/Users/jhosb/Documents/backups"
NOMBRE_BACKUP="respaldo_$(date +%Y-%m-%d-%H).tar.gz"
NOMBRE_BRANCH="respaldo_$(date +%Y-%m-%d-%H)"
echo "Iniciando proceso de respaldo y versionado..."
# 1. Crear respaldo
mkdir -p "$DESTINO"
tar -czf "$DESTINO/$NOMBRE_BACKUP" "$ORIGEN"
# 2. Verificar respaldo
if [ ! -f "$DESTINO/$NOMBRE_BACKUP" ]; then
    echo "Error al crear el respaldo!"
exit 1
fi
# 3. Actualizar repositorio Git
git add backups/"$NOMBRE_BACKUP"
git commit -m "Respaldo automático: $(date +%Y-%m-%d-%H)"
git branch $NOMBRE_BRANCH
git push origin $NOMBRE_BRANCH
echo "Rama subida a GitHub completado con éxito!"
#4. Envia el correo a los dos
python3 correo.py
echo "Proceso completado con éxito!"


