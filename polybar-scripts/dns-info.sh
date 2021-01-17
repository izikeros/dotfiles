#!/bin/bash
DNS=$(grep "nameserver" /etc/resolv.conf | sed 's/nameserver //' | grep -v '^#' | head -n1 |tr '\n' '|')
echo "DNS: $DNS"