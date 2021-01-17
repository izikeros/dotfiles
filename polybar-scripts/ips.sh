#!/bin/bash

# only IPs, no interface names
#ips=$(ip a | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -v '127.0.0' | grep -v '.255$' | tr '\n' '|')

# with interface names
#ips=$(ip -o addr show scope global | awk '{split($4, a, "/"); print $2" : "a[1]}' | sed 's/ //g' | tr '\n' '|')

# only default interface with interface name
default_interface=$(route | grep default | head -n1 | awk '{print $NF}')
ips=$(ip -o addr show scope global | grep $default_interface | awk '{split($4, a, "/"); print $2" : "a[1]}' | sed 's/ //g')

# only default interface without interface name
default_interface=$(route | grep default | head -n1 | awk '{print $NF}')
ips=$(ip -o addr show scope global | grep $default_interface | awk '{split($4, a, "/"); print a[1]}' | sed 's/ //g')

echo "$ips"