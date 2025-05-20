# create a tar file with /vw-data as its contents
tar cvf vw_backup.tar /vw-data
mv vw_backup.tar /mnt/storage-box/volume_backup/
#mount nginx-pm volumes and create a tar file with its contents
docker run --rm --volumes-from nginx-pm_app_1 -v $(pwd):/backup ubuntu tar cvf /backup/nginx_backup.tar /data
mv nginx_backup.tar /mnt/storage-box/volume_backup/
#mount authentik volumes and create a tar file with its contents
docker run --rm --volumes-from authentik_redis_1 -v $(pwd):/backup ubuntu tar cvf /backup/authentik_redis.tar /data
docker run --rm --volumes-from authentik_postgresql_1 -v $(pwd):/backup ubuntu tar cvf /backup/authentik_postgresql.tar /var/lib/postgresql/data
tar cvf authentik_media.tar /home/janik/docker-compose/authentik/media
tar cvf authentik_custom_templates.tar /home/janik/docker-compose/authentik/custom-templates
mv authentik_redis.tar /mnt/storage-box/volume_backup/
mv authentik_postgresql.tar /mnt/storage-box/volume_backup/
mv authentik_media.tar /mnt/storage-box/volume_backup/
mv authentik_custom_templates.tar /mnt/storage-box/volume_backup/
#mount paperless-web volumes and create a tar file with its contents
docker run --rm --volumes-from paperless_webserver_1 -v $(pwd):/backup ubuntu tar cvf /backup/paperless_web.tar /usr/src/paperless
mv paperless_web.tar /mnt/storage-box/volume_backup/
#mount paperless-db volumes
docker run --rm --volumes-from paperless_db_1 -v $(pwd):/backup ubuntu tar cvf /backup/paperless_db.tar /var/lib/postgresql/data
mv paperless_db.tar /mnt/storage-box/volume_backup/
#mount paperless-broker volumes
docker run --rm --volumes-from paperless_broker_1 -v $(pwd):/backup ubuntu tar cvf /backup/paperless_broker.tar /data
mv paperless_broker.tar /mnt/storage-box/volume_backup/
#mount kitchenowl volumes
docker run --rm --volumes-from kitchenowl_back_1 -v $(pwd):/backup ubuntu tar cvf /backup/kitchenowl_back.tar /data
mv kitchenowl_back.tar /mnt/storage-box/volume_backup/
#mount jellyfin volumes
docker run --rm --volumes-from jellyfin -v $(pwd):/backup ubuntu tar cvf /backup/jellyfin_config.tar /config
mv jellyfin_config.tar /mnt/storage-box/volume_backup/
#create tar file of music library
tar cvf media_backup.tar /home/janik/media/DnB/
mv media_backup.tar /mnt/storage-box/volume_backup/
