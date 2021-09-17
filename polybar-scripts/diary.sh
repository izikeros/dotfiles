#!/bin/zsh

DATE=$(date +%Y-%m-%d)                             
DOW=$(date +%u)                                    
days=(m t w h f s x)                                                         
DAY_LETTER=${days[$DOW]}                                                    
FNAME="${DATE}_${DAY_LETTER}"
YEAR=$(date +%Y)
pth="$HOME/vimwiki/diary/$YEAR/$FNAME.md"

subl3 $pth
