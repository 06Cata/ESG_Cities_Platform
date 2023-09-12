#!/bin/bash

# 先沒排程

datasets_file="1mon.txt"
base_dir="/home/bimap/esg/data/1mon/"
#log_file="1mon.log"

while IFS= read -r dataset; do
    IFS="," read -r id url <<< "$dataset"

    data_file="${base_dir}${id}.csv"

    curl -o "$data_file" "$url" -sS
done < "$datasets_file"

