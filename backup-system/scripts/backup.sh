#!/bin/sh

# Configurazione variabili
BACKUP_DIR="/tmp/backup-run"
DATE=$(date +%Y-%m-%d_%H-%M)
ARCHIVE_NAME="pi-docker-backup-${DATE}.tar.gz"
R2_BUCKET="cloudflare-r2:bucket_name" # Nome remote:Nome bucket
UPTIME_PUSH_URL="url_generated_from_uptime_kuma" # Inserisci qui l'URL generato da Uptime Kuma

echo "=== Inizio procedura di backup: ${DATE} ==="

mkdir -p ${BACKUP_DIR}

# 1. Creazione dell'archivio compresso delle cartelle Docker
echo "Creazione archivio compresso..."
tar -czf ${BACKUP_DIR}/${ARCHIVE_NAME} \
    --exclude='*.log' \
    --exclude='*.tmp' \
    /backup-source

if [ $? -eq 0 ]; then
    echo "Archivio creato con successo: ${ARCHIVE_NAME}"
else
    echo "Errore durante la creazione dell'archivio."
    # Notifica fallimento a Uptime Kuma (opzionale)
    wget -qO- "${UPTIME_PUSH_URL}?status=down&msg=TarFailed" > /dev/null 2>&1
    exit 1
fi

# 2. Caricamento su Cloudflare R2 tramite Rclone
echo "Caricamento su Cloudflare R2..."
rclone copy ${BACKUP_DIR}/${ARCHIVE_NAME} ${R2_BUCKET} --config /config/rclone/rclone.conf

if [ $? -eq 0 ]; then
    echo "Caricamento su Cloudflare R2 completato."
    
    # 3. Mantieni solo gli ultimi 7 backup su R2 (retention)
    echo "Pulizia vecchi backup su R2 (retention 7 giorni)..."
    rclone delete ${R2_BUCKET} --min-age 7d --config /config/rclone/rclone.conf
    
    # 4. Invia segnalazione positiva a Uptime Kuma
    echo "Notifica a Uptime Kuma..."
    wget -qO- "${UPTIME_PUSH_URL}?status=up&msg=BackupCompleted" > /dev/null 2>&1
else
    echo "Errore durante il caricamento con Rclone."
    wget -qO- "${UPTIME_PUSH_URL}?status=down&msg=RcloneUploadFailed" > /dev/null 2>&1
    exit 1
fi

# Pulizia locale del file temporaneo
rm -rf ${BACKUP_DIR}
echo "=== Backup completato con successo ==="
