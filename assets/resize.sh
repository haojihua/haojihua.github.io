#!/bin/bash
#script form https://unix.stackexchange.com/questions/38943/use-mogrify-to-resize-large-files-while-ignoring-small-ones
files=*
minimumWidth=800
minimumHeight=800

for f in $files
do
    imageWidth=$(identify -format "%w" "$f")
    imageHeight=$(identify -format "%h" "$f")

    if [ "$imageWidth" -gt "$minimumWidth" ] || [ "$imageHeight" -gt "$minimumHeight" ]; then
	echo "$f"
        mogrify -resize ''"$minimumWidth"x"$minimumHeight"'' "$f"
    fi
done
