#!/bin/zsh

DATE=$(date +%Y-%m-%d)                             
DOW=$(date +%u)                                    
days=(m t w h f s x)                                                         
DAY_LETTER=${days[$DOW]}                                                    
FNAME="${DATE}_${DAY_LETTER}"

subl3 "$HOME/vimwiki/diary/$FNAME.md"
