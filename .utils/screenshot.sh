#!/bin/bash
fileName=$(date '+%Y-%m-%d-%H-%M-%s')
filePath=~/common/pictures/screenshots

maim ${@} ${filePath}/${fileName}.png

canberra-gtk-play -i screen-capture -d "screen-shot"
