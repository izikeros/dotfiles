#!/usr/bin/env bash
sudo iftop -i $(route | grep default | head -n1 | awk '{print $NF}')

