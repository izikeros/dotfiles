#!/usr/bin/env bash
# exit on error (-e)
# print all commands before execution (-o xtrace)

set -e -o xtrace

# get URL of video to download, e.g. https://www.youtube.com/watch?v=zQ0v-rEvLNg
#URL=$1

# Create output directory and download video there
#OUT_NAME=$(date +%Y-%m-%d__%H_%M)
#OUT_DIR="$HOME/Videos/Filant/$OUT_NAME"
#mkdir -p "$OUT_DIR"
#cd "$OUT_DIR"
# download the video
#youtube-dl $URL -o $OUT_NAME

# 1292x724 (vid:1280x720) | 1932x1084 (vid:1920x1080)
CROP_SIZE=1292x724
#VID_EXT="mp4"
#OUT_NAME=$(find ./ -name "*.$VID_EXT")
OUT_NAME=$1
#VIDEO_FILE="$OUT_DIR"/"$OUT_NAME".mkv
RES=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$OUT_NAME")
echo $RES
if [ $RES = "1920x1080" ]; then
	CROP_SIZE="1932x1084"
elif [ $RES = "1280x720" ]; then
	CROP_SIZE="1292x724"
else
	exit 1
fi
OUT_DIR_NAME=$(basename "$OUT_NAME" .mp4)
# generate thumbnails (TODO: find fastest satysfying method for generating thumbnails, compare oprions from superuser.com)
#  speed ~280x
mkdir -p "$OUT_DIR_NAME"/frames
#find -name "*.mkv" | xargs -I{} ffmpeg -skip_frame nokey -i {} -vsync 0 -r 30 -f image2 frames/thumbnails-%02d.jpeg

# create directory where to keep unique slides
mkdir -p "$OUT_DIR_NAME"/uniq_frames

#directory to keep OCR text
mkdir -p "$OUT_DIR_NAME"/ocr_txt
# findimagedupes return similar files in one row
#  - take first file from each row and copy to uniq folder
#findimagedupes frames/ | awk -F" " '{print $1}' | xargs -I{} mv {} ./uniq_frames

echo "== Extracting thumbnails wall image ==="
ezthumb -g 1x40 -s 100% -p 2pass "$OUT_NAME"
#there is overall header ~60px height and each image header ~25px

echo "== Cutting wall image into separate frames ==="
# crop resulting image into separate images. Start cropping from the bottom
convert *_thumb.jpg -flip -crop $CROP_SIZE -flip "$OUT_DIR_NAME"/frames/output_%03d.jpg

echo "== Cropping bottom part ==="
# crop bottom 25px
mogrify -format jpg -gravity south -chop 0x25 "$OUT_DIR_NAME"/frames/*.jpg

echo "== Uniq (not implemented) ==="
mv "$OUT_DIR_NAME"/frames/* "$OUT_DIR_NAME"/uniq_frames

# cleanup directory
rm -rf "$OUT_DIR_NAME"/frames

# reverse order in uniq_frames
IFS=$'\n' # the input field separators include space by default
i=1
for f in $(ls -r "$OUT_DIR_NAME"/uniq_frames/*.jpg); do 
    echo mv "$f" "IMG_$(printf %04d $i)".jpg
    (( i++ ))
done

#findimagedupes frames/ | awk -F" " '{print $1}' | xargs -I{} mv {} ./uniq_frames

# extract text wth tesseract from ezthumb image
# find ./ -name "*.jpg" | xargs -I{} tesseract {} {} -l pol

echo "== Performing OCR ==="
# extract text wth tesseract from ffmpeg frames
find "$OUT_DIR_NAME"/uniq_frames/ -name "*.jp*g" | xargs -I{} tesseract {} {} -l pol

# move ocr text files to separate dir
mv "$OUT_DIR_NAME"/uniq_frames/*.txt "$OUT_DIR_NAME"/ocr_txt

# remove duplicated text files
fdupes "$OUT_DIR_NAME"/ocr_txt -d -I

# reverse order of files (frames were extracted from the bottom) and merge all slides text into single summary file
cd $OUT_DIR_NAME
find ocr_txt/ -name "*.txt" | sort -r | xargs -I{} sh -c 'cat "{}" >> all_ocr.txt | echo "------" >> all_ocr.txt'
cd ..