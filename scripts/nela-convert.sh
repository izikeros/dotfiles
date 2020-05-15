#!/bin/bash
# nela-convert.sh - convert Nela clips downloaded to nela_out to mp4 format

# the native ffmpeg AAC audio encoder was experimental and you needed
# to add -strict -2 or -strict experimental to your command use it.
# However, this encoder is no longer marked as experimental,
# so recent ffmpeg builds do not need to use this option

# TODO: check if out dir exists, if not, try to create it
OUTDIR="../nela_out"

if [ -d $OUTDIR ];then
    echo "Saving converted files to: $OUTDIR"
else
    echo "Creating directory for the output: $OUTDIR"
    mkdir -p $OUTDIR
fi

for filename in *.ismv; do
    ffmpeg -i "$filename" -acodec aac -vcodec libx264 -f mp4 $OUTDIR/"$filename".mp4
done
