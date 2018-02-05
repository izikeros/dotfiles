#!/bin/bash
sudo systemctl restart NetworkManager.service
nmcli connection up "wilabs (openvpn)"
