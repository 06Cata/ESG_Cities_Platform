echo `date '+%Y-%m-%d %H:%M:%S'`

#time=`date -d "-2 hours" +%H:%M`
#datex=`date -d "-2 day" +%Y-%m-%d`
year="112"

echo $year
echo $datex
#echo $time

#d993d77c-e344-49c9-be7f-618bd154ae02

### 9127 金門重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_23?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9127/9127.csv

### 9132 高雄重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_07?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9132/9132.csv

### 9133 基隆市重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_20?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9133/9133.csv

### 9140 嘉義縣重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_15?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9140/9140.csv

### 9143 臺北市重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_04?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9143/9143.csv

### 9145 臺南市重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_06?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9145/9145.csv

### 9371 連江縣重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_24?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9371/9371.csv

### 9128 南投縣重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_13?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9128/9128.csv

### 9131 桃園市重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_09?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9131/9131.csv

### 9138 新竹縣重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_10?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9138/9138.csv

### 9146 澎湖縣重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_19?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9146/9146.csv

### 9125 宜蘭縣重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_08?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9125/9125.csv

### 9126 花蓮縣重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_18?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9126/9126.csv

### 9129 屏東縣重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_16?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9129/9129.csv

### 9130 苗栗縣重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_11?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9130/9130.csv

### 9135 雲林縣重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_14?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9135/9135.csv

### 9136 新北市重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_03?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9136/9136.csv

### 9137 新竹市重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_21?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9137/9137.csv

### 9139 嘉義市重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_22?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9139/9139.csv

### 9141 彰化縣重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_12?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9141/9141.csv

### 9142 臺中市重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_05?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9142/9142.csv

### 9144 臺東縣重要環保統計資料
curl "https://data.epa.gov.tw/api/v2/stat_p_17?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=year,EQ,$year" | sed '1d' >> /home/bimap/esg/data/env/9144/9144.csv














