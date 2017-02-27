cat root_packets.txt | xargs apt-get --yes install

# get visual studio code
wget https://go.microsoft.com/fwlink/?LinkID=760868 -O code.deb
dpkg -i code.deb
