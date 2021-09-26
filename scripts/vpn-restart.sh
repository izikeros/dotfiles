#!/usr/bin/env bash

sudo systemctl restart NetworkManager.service
#nmcli connection up "wilabs (openvpn)"
nmcli connection up "wilabs"
