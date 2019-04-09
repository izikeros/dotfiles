#!/bin/bash
sudo mkdir -p /mnt/sda4
sudo echo "/dev/sda4 /mnt/sda4          ext4    defaults        0       2" | sudo tee -a /etc/fstab
sudo mount /dev/sda4
ln -s /mnt/sda4/bulk /home/bulk
