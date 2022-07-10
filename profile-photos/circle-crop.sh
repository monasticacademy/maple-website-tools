#!/bin/bash

IN=$1
OUT=$2

# output size in pixels
SIZE=500

# border width
BORDERWIDTH=8

# border color
BORDERCOLOR=black

# compute some quantities
CENTER=$(($SIZE / 2))
INNER=$(($CENTER - 2))

convert $IN \
        -thumbnail ${SIZE}x${SIZE}^ -gravity north -crop ${SIZE}x${SIZE}+0+0 +repage \
        \( -clone 0 -fill black -colorize 100% \
        -fill white -draw "translate ${CENTER},${CENTER} circle 0,0 ${INNER},0" -alpha off \) \
        \( -clone 1 -morphology edgein octagon:${BORDERWIDTH} \) \
        \( -clone 0 -fill ${BORDERCOLOR} -colorize 100% \) \
        \( -clone 0 -clone 3 -clone 2 -compose over -composite \) \
        -delete 0,2,3 +swap \
        -alpha off -compose copy_opacity -composite \
        $OUT
