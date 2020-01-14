#!/bin/sh

# redsocks proxy
sudo systemctl restart redsocks.service
#sudo systemctl stop redsocks.service
#sudo systemctl start redsocks.service
sudo iptables-restore < /etc/iptables/iptables.rules
sudo systemctl restart redsocks.service
#sudo systemctl stop redsocks.service
#sudo systemctl start redsocks.service
