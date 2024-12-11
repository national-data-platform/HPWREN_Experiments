#!/bin/sh
file="HPWREN_RESULTS/checkpoint.txt"
prefix="/images/hpwren.ucsd.edu/hpwren.ucsd.edu/HPWREN-FIgLib/HPWREN-FIgLib-Data/"
append="https://cdn.hpwren.ucsd.edu/HPWREN-FIgLib-Data/"
directory="hpwren-figlib"
plus_replace="%2B"
plus_original="+"

if [ ! -d "$directory" ]; then
    mkdir $directory
fi

while read -r line; do
    image_path="${line:${#prefix}}"
    fire_dir="${image_path%%/*}"
    image_filename="${image_path:${#fire_dir}}"
    #Replace + with %2B for images with fire/smoke
    if [[ $image_filename == *$plus_original* ]]; then
        modified_image_filename="${image_filename//$plus_original/$plus_replace}"
        echo $modified_image_filename
        image_url="$append$fire_dir$modified_image_filename"
    else
        image_url="$append$image_path"
    fi
    if [ ! -d "$directory/$image_path" ]; then
        wget $image_url -P $directory/$fire_dir
    fi
done <$file