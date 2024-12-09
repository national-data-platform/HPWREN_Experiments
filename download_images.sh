#!/bin/sh
file="HPWREN_RESULTS/checkpoint.txt"
prefix="/images/hpwren.ucsd.edu/hpwren.ucsd.edu/HPWREN-FIgLib/HPWREN-FIgLib-Data/"
append="https://cdn.hpwren.ucsd.edu/HPWREN-FIgLib-Data/"
directory="hpwren-figlib"

if [ ! -d "$directory" ]; then
    mkdir $directory
fi

while read -r line; do
    image_path="${line:${#prefix}}"
    fire_dir="${image_path%%/*}"
    image_url="$append$image_path"
    if [ ! -d "$directory/$image_path" ]; then
        wget $image_url -P $directory/$fire_dir
    fi
done <$file