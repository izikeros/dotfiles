#!/bin/sh

sudo systemctl stop redsocks.service
sudo iptables --flush
sudo iptables-restore < /etc/iptables/iptables.rules
sudo systemctl start redsocks.service
