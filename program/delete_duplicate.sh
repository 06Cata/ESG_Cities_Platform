#!/bin/bash

# 請將下面的文件路徑替換為您要處理的文檔路徑
file_path="/home/bimap/russell/145035_2.csv"

# 將原始文件中的內容透過 awk 命令過濾，並輸出到一個新的臨時文件
awk '!seen[$0]++' "$file_path" > "${file_path}.tmp"

# 將臨時文件替換原始文件
mv "${file_path}.tmp" "$file_path"

echo "已刪除文檔中相同的資料行。"

