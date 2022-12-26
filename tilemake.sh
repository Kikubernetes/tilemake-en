#!/bin/bash

# Make tiles from pngs. You can select Minimum 2 to Maximum 6 series.
# First make screen capture of your image with mrview and save as pngs (same number from all images).

read -p "How many png files per image? > " nump
num=$((nump-1))
echo "There are ${nump} images in one series."
read -p "Enter the names of the images you want to arrange separated by spaces(eg. T1 T2 DWI...)> " -a ary
numary=${#ary[@]}
echo "A series of tiled images will be created with ${numary} series of images."
echp "The order of arrangement is ${ary}"

case $numary in
    [0-1])  echo "Please select 2 to 6 series of images."
            exit ;;
    2)
    for i in `seq -f "%04g" 0 1 $num`; do
	    pngappend \
	    ${ary[0]}${i}.png + \
        ${ary[1]}${i}.png  \
        tile$i.png 
    done
     ;;
    3)
    for i in `seq -f "%04g" 0 1 $num`; do
	    pngappend \
	    ${ary[0]}${i}.png + \
        ${ary[1]}${i}.png + \
        ${ary[2]}${i}.png  \
        tile$i.png 
    done
     ;;
    4)
    for i in `seq -f "%04g" 0 1 $num`; do
	    pngappend \
	    ${ary[0]}${i}.png + \
        ${ary[1]}${i}.png + \
        ${ary[2]}${i}.png - \
        ${ary[3]}${i}.png  \
        tile$i.png 
    done
     ;;
    5)
    for i in `seq -f "%04g" 0 1 $num`; do
	    pngappend \
	    ${ary[0]}${i}.png + \
        ${ary[1]}${i}.png + \
        ${ary[2]}${i}.png - \
        ${ary[3]}${i}.png + \
        ${ary[4]}${i}.png  \
        tile$i.png 
    done
     ;;
    6)  
    for i in `seq -f "%04g" 0 1 $num`; do
	    pngappend \
	    ${ary[0]}${i}.png + \
        ${ary[1]}${i}.png + \
        ${ary[2]}${i}.png - \
        ${ary[3]}${i}.png + \
        ${ary[4]}${i}.png + \
        ${ary[5]}${i}.png \
        tile$i.png 
    done
     ;;
     *) echo "Please select 2 to 6 series of images." 
        exit ;;
esac
mkdir tiles
mv tile*.png tiles/
exit
