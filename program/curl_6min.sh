echo `date '+%Y-%m-%d %H:%M:%S'`

time=`date -d "-2 hours" +%H:%M`
datex=`date +%Y-%m-%d`

echo $datex
echo $time

### 31968
echo "execute 31968 api at $datex $time" >> /home/bimap/esg/program/execute_log/6min_record.log 
curl "https://data.moenv.gov.tw/api/v2/aqx_p_185?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=m_time,EQ,$datex%20$time" | sed '1d' >> /home/bimap/esg/data/6min/31968-$datex.log



