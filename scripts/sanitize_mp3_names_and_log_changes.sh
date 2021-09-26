#!/usr/bin/env bash
set -e

pwd
IFS=$'\n'
for f in $(find ./ -name '*.mp3'); do
  folder=${f%/*}
  
  #echo $folder
  file=${f##*/}
  file2=`echo $file | sed s/\s/_/`
  folder2=`echo $folder | sed s/\s/_/`
 
  
  
  dst=$folder2\_$file2
  echo $f -- $dst
  mv "$f" "$dst"
  #echo ${folder##*/}"/"$file "-->" $(printf %03.f "$(( 10#${file%% *} ))") ${file#* } >> rename_log.out
  #mv "$f" ${folder##*/}$(printf %03d "$(( 10#${file%% *} ))") ${file#* }"
done