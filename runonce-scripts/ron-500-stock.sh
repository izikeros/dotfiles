#!/usr/bin/env bash

# ticker.sh accept Yahoo finance tickers
~/dotfiles/scripts/ticker.sh $(cat ~/.ticker.conf) | sed 's/CNYA/Chin/' | sed 's/IQQH.DE/Energ  /' | sed 's/RBOT.L/Robot /' | sed 's/GC=F/Gold/' | sed 's/\^GSPC/SP500/'

#~/dotfiles/scripts/bankier.sh ETFSP500
#echo '-----'
#~/dotfiles/scripts/bankier.sh ZLOTO WIG20 MWIG40
#~/dotfiles/scripts/ticker.sh GC=F ^GSPC BTC-USD
~/dotfiles/scripts/ticker.sh DOT1-USD ETH-USD BTC-USD
