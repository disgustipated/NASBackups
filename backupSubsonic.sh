#! /bin/sh
find /mnt/zfsPool/backup/subsonic/ -mtime +5 -exec rm -rf {} \;
pkill -f subsonic-booter-jar-with-dependencies.jar
sleep 45
cp -R /mnt/zfsPool/sys/subsonic/ /mnt/zfsPool/backup/servers/subsonic/"`date`"
tmux send-keys -t2 "cd /mnt/zfsPool/sys/subsonic ;su subsonic -c ./subsonic.sh" C-m