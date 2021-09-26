#!/usr/bin/env bash
# stock-bankier.sh
# Getting stock, some currency data from bankier.pl
# Supported currency: EUR, USD
#
# usage:
# ./stock-bankier.sh ticker
# sample tickers:
#   MERCATOR
#   WIG20
#   mWIG40
#   ZLOTO
#   EUR
#
# sample usage:
#   ./stock-bankier.sh WIG20 JSW mWIG40
# 
# author: Krystian Safjan (ksafjan@gmail.com)
# Licence MIT

set -e

SYMBOLS=("$@")

usage="Usage: $0 TICKER_1 [TICKER_2] [TICKER_N]"

if [ -z "$SYMBOLS" ]; then
  echo $usage
  exit
fi


# Text color variables
txtbld=$(tput bold)             # Bold
red=$(tput setaf 1)
green=$(tput setaf 2)
white=$(tput setaf 7)
txtrst=$(tput sgr0)             # Reset

OUTPUT=''
S=' '
for symbol in $(IFS=' '; echo "${SYMBOLS[*]}" | tr '[:lower:]' '[:upper:]'); do
	raw=""
	if [ $symbol = 'EUR' ]; then		
		raw=$(wget -qO- https://www.bankier.pl/waluty/kursy-walut/nbp/EUR | grep -A4 'div class="right textNowrap"')
	fi
	
	if [ $symbol = 'USD' ]; then		
		raw=$(wget -qO- https://www.bankier.pl/waluty/kursy-walut/nbp/USD | grep -A4 'div class="right textNowrap"')
	fi

	if [ -z "$raw" ];then
		raw=$(wget -qO- https://www.bankier.pl/inwestowanie/profile/quote.html\?symbol\=$symbol | grep -A4 'div class="right textNowrap"')
	fi

	vals=$(echo $raw | sed -e 's/<[^>]*>//g' | sed -e 's/&nbsp;//g'| sed '/^\s*$/d')
	vals=$(echo $vals | sed 's/ zł/_zł/g'| sed 's/ USD\/uncja/_USD\/uncja/g'| sed 's/ USD\/baryłka/_USD\/baryłka/g')

	# echo -e "vals: $vals|"
	val=$(echo "$vals" | awk -F' ' '{print $1}')
	percent=$(echo "$vals" | awk -F' ' '{print $2}')
	# change=$(echo $vals | awk -F' ' '{print $3}')
	# echo "val: $val|"
	# echo "percent: $percent|"

	# set color
	color="$white"
	if echo $raw | grep -q "change up"; then
    	color="$green"
	fi
	if echo $raw | grep -q "change down"; then
    	color="$red"
	fi
	OUTPUT="$OUTPUT$txtbld$symbol$txtrst$S$color$val$S$color$percent$txtrst\n"
done
echo -e "$OUTPUT" | column -t 