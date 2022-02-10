#!/bin/bash
YL='\033[1;33m'
NC='\033[0m' # No Color
now=$(date +"%Y-%m-%d---|---%H:%M:%S")
mkdir /tmp/nida-live-backup
sudo /opt/bitnami/ctlscript.sh stop
sudo tar -pczvf "/tmp/nida-live-backup/NIDA-Live-$now.tar.gz" /opt/bitnami
rclone copy "/tmp/nida-live-backup/NIDA-Live-$now.tar.gz"  nida-live-backup2:Backups/NIDA-Live
sudo /opt/bitnami/ctlscript.sh start
rm -r /tmp/nida-live-backup
printf "${YL}Done${NC}"
curl -H 'Content-Type: application/json' -d '{"text": "NIDA Live backup compleated"}' https://nidaau.webhook.office.com/webhookb2/2be69388-e574-40cc-b1af-ac980655182c@91767ffb-e0d7-4211-bc8b-fbce28a9f6ee/IncomingWebhook/07d3943692f44fb29c4f07bc11d6e612/9251ef8b-c64a-4489-ae4e-16dc32f474a2
echo #for new line