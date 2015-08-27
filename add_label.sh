#!/bin/bash

for file in $1/*.jpg ;
	do
		echo `Processing file $file`
		filename=`convert $file -ping -format "%t" info:`
		width=`convert $file -ping -format "%w" info:`
		author=`identify -format "%[EXIF:Artist]" $file`
		height=20
		`convert $file \( -size ${width}x${height} xc:white \) -append \( -background white -size x${height} -fill black label:"$file" \) -gravity southwest -compose over -composite \( -background white -size x${height} -fill black label:"${author}" \) -gravity southeast -compose over -composite $file`
done
