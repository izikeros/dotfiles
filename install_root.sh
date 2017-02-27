cat packets.txt | xargs apt-get --yes install

# install oh my zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# get visual studio code
wget https://go.microsoft.com/fwlink/?LinkID=760868 -O code.deb
dpkg -i code.deb


