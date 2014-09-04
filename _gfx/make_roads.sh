#!/bin/bash

for i in {2..20}; do
    convert road_print.png -crop 16x${i}+0+0 road_${i}.png
    pngquant 16 - < road_${i}.png > ../img/road_${i}.png
    rm road_${i}.png
done
