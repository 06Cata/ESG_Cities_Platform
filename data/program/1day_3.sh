#!/bin/bash
datasets_file="/home/bimap/esg/data/datalist/1day_3.txt"
base_dir="/home/bimap/esg/data/1day_3/"

while IFS= read -r dataset; do
    IFS="," read -r id url <<< "$dataset"

    data_file="${base_dir}${id}.csv"

    curl -o "$data_file" "$url" -sS

    echo "[$(date)] 資料集 ID $id 寫入成功。"
done < "$datasets_file"

