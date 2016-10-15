#!/bin/bash
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
