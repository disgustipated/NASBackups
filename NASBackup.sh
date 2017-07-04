rsync --progress -a --no-links -x -v --delete --exclude 'cam' /mnt/zfsPool/* /mnt/backup/NASBackup/ >> /root/backup.log
