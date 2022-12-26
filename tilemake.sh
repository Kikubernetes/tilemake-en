#!/bin/bash

# Make tiles from mrview screen captured pngs. Minimum 2 series to Maximum 6 series.
# First make screen capture your image with mrview and save as pngs (same number from all images).
# mrviewのScreenCaptureでスライドにしたいpng画像を保存して下さい。
# 一枚のスライドに2−6枚の画像を並べることができます。

read -p "１画像あたり何枚のpngファイルがありますか?> " nump
num=$((nump-1))
echo "画像の枚数は${nump}枚です"
read -p "並べたい順に画像の名前をスペースで区切って入力して下さい> " -a ary
numary=${#ary[@]}
echo "${ary[@]}の${numary}種類の画像からタイル画像を作ります"

case $numary in
    [0-1])  echo "2-6種類の画像を選んでください。"
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
     *) echo "2-6種類の画像を選んでください。" 
        exit ;;
esac
mkdir tiles
mv tile*.png tiles/
exit
