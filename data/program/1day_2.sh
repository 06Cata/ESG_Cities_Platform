#!/bin/bash
base_dir="/home/bimap/esg/data/1day_2/"
datasets_file="/home/bimap/esg/data/datalist/1day_2.txt"

datex=$(date -d "1 day ago" +%Y-%m-%d)
echo "datex: $datex"

while IFS= read -r dataset; do
    IFS="," read -r id url <<< "$dataset"

    # Replace "datex" in the URL with the actual value of the `datex` variable
    url=$(echo "$url" | sed "s/datex/$datex/g")

    data_file="${base_dir}${id}.csv"
    temp_file="${base_dir}${id}_temp.csv"

    curl -o "$temp_file" "$url" -sS

    if [ -f "$data_file" ]; then
        # Check if last records are the same
        last_old_record=$(tail -n 1 "$data_file")
        last_new_record=$(tail -n 1 "$temp_file")
        if [ "$last_old_record" != "$last_new_record" ]; then
            tail -n +2 "$temp_file" >> "$data_file"
            echo "[$(date)] 資料集 ID $id 寫入成功。"
        else
            echo "[$(date)] 資料集 ID $id 上次資料相同。不寫入。"
        fi
    else
        tail -n +2 "$temp_file" >> "$data_file"
        echo "[$(date)] 資料集 ID $id 寫入成功。"
    fi

    rm "$temp_file"
done < "$datasets_file"


