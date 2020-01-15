#!/bin/sh

sudo systemctl stop redsocks.service
sudo iptables --flush
sudo cat /etc/iptables/iptables.rules | iptables-restore
sudo systemctl start redsocks.service
