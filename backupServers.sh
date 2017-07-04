#! /bin/sh
#subsonic
find /mnt/zfsPool/backup/servers/subsonic/ -mtime +5 -exec rm -rf "'{}'" \;
pkill -f subsonic-booter-jar-with-dependencies.jar
sleep 45
cp -R /mnt/zfsPool/sys/subsonic/ /mnt/zfsPool/backup/servers/subsonic/"`date`"

#PMS
find /mnt/zfsPool/backup/servers/pms/ -mtime +5 -exec rm -rf '{}' \;
pkill -f PMS
sleep 45
cp -R /mnt/zfsPool/sys/pms/ /mnt/zfsPool/backup/servers/pms/"`date`"


#sabnzbd
find /mnt/zfsPool/backup/servers/sabnzbd/ -mtime +5 -exec rm -rf '{}' \;
pkill -f SABnzbd
sleep 45
cp -R /mnt/zfsPool/sys/sabnzbd/ /mnt/zfsPool/backup/servers/sabnzbd/"`date`"

#couchpotato
find /mnt/zfsPool/backup/servers/couchpotato/ -mtime +5 -exec rm -rf "'{}'" \;
pkill -f CouchPotato
sleep 45
cp -R /mnt/zfsPool/sys/couchpotato/ /mnt/zfsPool/backup/servers/couchpotato/"`date`"

#sickbeard
find /mnt/zfsPool/backup/servers/sickbeard/ -mtime +5 -exec rm -rf '{}' \;
pkill -f SickBeard
sleep 45
cp -R /mnt/zfsPool/sys/sickbeard/ /mnt/zfsPool/backup/servers/sickbeard/"`date`"


#scripts
find /mnt/zfsPool/backup/scripts/ -mtime +5 -exec rm -rf '{}' \;
cp -R /mnt/zfsPool/sys/scripts/ /mnt/zfsPool/backup/scripts/"`date`"


tmux send-keys -t2 "cd /mnt/zfsPool/sys/subsonic ;su subsonic -c ./subsonic.sh" C-m
tmux send-keys -t3 "cd /mnt/zfsPool/sys/pms;su disgustipated -c ./PMS.sh" C-m
tmux send-keys -t4 "cd /mnt/zfsPool/sys/sabnzbd;python SABnzbd.py -s 6.13.0.138:8613" C-m
tmux send-keys -t5 "cd /mnt/zfsPool/sys/couchpotato/RuudBurger-CouchPotato-33a99b4;python CouchPotato.py" C-m
tmux send-keys -t6 "cd /mnt/zfsPool/sys/sickbeard/midgetspy-Sick-Beard-b3a7afe;python SickBeard.py" C-m