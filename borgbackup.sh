#!/bin/bash
export BORG_PASSPHRASE="&W9GWqUeXfMb@8"

LOG="/var/log/borg/backup.log"
BACKUP_USER="u384815"
REPO_DIR="./backups/ubuntu/"
SSH_REPO="ssh://${BACKUP_USER}@u384815.your-storagebox.de:23/${REPO_DIR}"


exec &> >(tee -a "$LOG.tmp")
exec 2>&1

echo "#### Backup gestartet: $(date) ####"

borg create -v --stats 			  \
	$SSH_REPO::'{now:%Y-%m-%d_%H-%M}' \
	/root				  \
	/vw-data			  \
	/var/www/			  \
	/opt				  \
	/home				  \
	/etc				  \
	--exclude /mnt

echo "#### Backupbeendet: $(date) ####"

cat ${LOG}.tmp >> ${LOG}
rm ${LOG}.tmp
