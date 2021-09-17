#!/bin/zsh

DATE=$(date +%Y-%m-%d)                             
DOW=$(date +%u)                                    
days=(m t w h f s x)                                                         
DAY_LETTER=${days[$DOW]}                                                    
FNAME="${DATE}_${DAY_LETTER}"
YEAR=$(date +%Y)
pth="$HOME/vimwiki/diary/$YEAR/$FNAME.md"

if [ -s "$pth" ];then
    status_txt="diary ok"
else
	status_txt="NO DIARY"
fi
echo $status_txt