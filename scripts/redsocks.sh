#!/bin/sh
# redsock.sh - restart redsocks proxy service, apply iptables rules

# redsocks proxy
sudo systemctl restart redsocks.service
#sudo systemctl stop redsocks.service
#sudo systemctl start redsocks.service
sudo cat /etc/iptables/iptables.rules | iptables-restore
sudo systemctl restart redsocks.service
#sudo systemctl stop redsocks.service
#sudo systemctl start redsocks.service
