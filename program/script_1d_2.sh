#!/bin/bash

datex=$(date -d "1 day ago" +%Y-%m-%d)

datasets=(
    "6351,https://data.epa.gov.tw/api/v2/ems_s_07?api_key=e8dd42e6-9b8b-43f8-991e-b3dee723a52d&format=CSV&filters=anno_date,EQ,$datex"
    "34829,https://data.epa.gov.tw/api/v2/aqx_p_17?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=monitordate,EQ,$datex%20"
    "34830,https://data.epa.gov.tw/api/v2/aqx_p_18?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=monitordate,EQ,$datex%20"
    "91081,https://data.epa.gov.tw/api/v2/aqx_p_304?api_key=e8dd42e6-9b8b-43f8-991e-b3dee723a52d&format=CSV&filters=monitordate,EQ,$datex"

    "40507,https://data.epa.gov.tw/api/v2/aqx_p_434?api_key=e8dd42e6-9b8b-43f8-991e-b3dee723a52d&format=CSV&filters=monitordate,EQ,$datex"
#    "x,https://data.epa.gov.tw/api/v2/aqx_p_304?api_key=e8dd42e6-9b8b-43f8-991e-b3dee723a52d&format=CSV&filters=monitordate,EQ,$datex"
#    "x,https://data.epa.gov.tw/api/v2/aqx_p_304?api_key=e8dd42e6-9b8b-43f8-991e-b3dee723a52d&format=CSV&filters=monitordate,EQ,$datex"


)

log_file="download_log.txt"

for dataset in "${datasets[@]}"; do
    IFS="," read -r id url <<< "$dataset"

    data_file="/home/bimap/esg/data/1day/${id}.csv"
    temp_file="/home/bimap/esg/data/1day/${id}_temp.csv"

    curl "$url" | sed '1d' > "$temp_file"

    # 檢查暫存檔是否為空
    if [ -s "$temp_file" ]; then
        cat "$temp_file" >> "$data_file"
        echo "資料集 ID ${id} 寫入成功。" >> "$log_file"
    else
        echo "資料集 ID ${id} 當日無新資料。不寫入。" >> "$log_file"
    fi

    rm "$temp_file"
done
