#!/bin/bash
YL='\033[1;33m'
now=$(date +"%Y%m%d")
mkdir /tmp/nida-live-backup
sudo /opt/bitnami/ctlscript.sh stop
sudo tar -pczvf "/tmp/nida-live-backup/NIDA-Live-$now.tar.gz" /opt/bitnami
rclone copy "/tmp/nida-live-backup/NIDA-Live-$now.tar.gz"  nida-live-backup2:Backups/NIDA-Live
sudo /opt/bitnami/ctlscript.sh start
printf "${YL} Done"
echo