echo `date '+%Y-%m-%d %H:%M:%S'`

#time=`date -d "-2 hours" +%H:%M`
datex=`date -d "-2 day" +%Y-%m-%d`

echo $datex
echo $time





exit


### 34829
echo "now `date`"  >> /home/bimap/esg/program/execute_log/1day_record.log
echo "execute api 34829 at $datex $time" >> /home/bimap/esg/program/execute_log/1day_record.log
curl -X GET "https://data.epa.gov.tw/api/v2/aqx_p_17?language=zh&api_key=d993d77c-e344-49c9-be7f-618bd154ae02&format=CSV&filters=monitordate,EQ,$datex%20" -H "accept: */*" | sed '1d' >> /home/bimap/esg/data/1day/34829.log






exit




