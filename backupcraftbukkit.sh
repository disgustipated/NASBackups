#! /bin/sh
find /mnt/zfsPool/backup/subsonic/ -mtime +30 -exec rm -rf {} \;
tmux send-keys -t1 "say server going down for backup in 200 seconds" C-m
sleep 100
tmux send-keys -t1 "say server going down for backup in 100 seconds" C-m
sleep 90
tmux send-keys -t1 "say server going down in 10" C-m
sleep 10
tmux send-keys -t1 "say NO SOUP FOR YOU ..... back in about a minute or two" C-m
tmux send-keys -t1 "save-all" C-m
tmux send-keys -t1 "stop" C-m
sleep 20
cp -R /mnt/zfsPool/sys/craftBukkit/ /mnt/zfsPool/backup/servers/craftbukkit/"`date`"
sleep 100
tmux send-keys -t1 "cd /mnt/zfsPool/sys/craftBukkit ; ./craftbukkit.sh" C-m
