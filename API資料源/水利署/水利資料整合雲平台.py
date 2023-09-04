import requests
import re
import csv
import json


url = "https://data.wra.gov.tw/openapi/api/OpenData/openapi"

response = requests.get(url)
data = response.json()

# 移除HTML標籤
clean_data = re.sub('<.*?>', '', str(data))


# 將資料轉換回JSON格式
clean_data_json = eval(clean_data)


paths = []
for path in clean_data_json['paths']:
    paths.append(path)
print(paths)
print('----------------------------')

datas_list = []
for p in paths:
    data_dic = {}
    data = clean_data_json['paths'][p]['get']
    data1 = clean_data_json['paths'][p]['servers'][0]['url']
    if data1 == 'https://data.wra.gov.tw/':
        apiurl = data1+'openapi'+p
    elif data1 == 'https://iot.wra.gov.tw/':
        apiurl = 'https://iot.wra.gov.tw'+p
    data_dic['資料標題'] = data['summary']
    data_dic['API網址'] = apiurl
    description = data['description']
    match = re.search(r'更新頻率\s(.+?)\s', description)
    if match:
        update_frequency = match.group(1)
    data_dic['更新頻率'] = update_frequency
    datas_list.append(data_dic)
    # print(data_dic)
print(datas_list)

labels = ['資料標題','API網址','更新頻率']
try:
    with open('水利資料整合雲平台.csv','w',encoding='utf-8-sig',newline='') as f:
        writer = csv.DictWriter(f, fieldnames=labels)
        writer.writeheader()
        for data in datas_list:
            writer.writerow(data)
        # writer.writerows(datas_list) # 沒有column標題
except IOError:
    print("I/O error")


filename = '水利資料整合雲平台.csv'
with open(filename, 'r', encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        print(row)
        api_url = row['API網址']
        frequency = row['更新頻率']
        if frequency == '不定期:上傳機關依據現場狀況進行上傳週期調整':
            frequency = '不定期'
        title = row['\ufeff資料標題']
        print(api_url)
        response = requests.get(api_url)
        data = response.json()
        print(data)

        filename = './水利署/data/(' + frequency + ')' + title + '.json'

        with open(filename, 'w', encoding='utf-8') as jsonfile:
            json.dump(data, jsonfile, ensure_ascii=False, indent=4)
            print(f'已寫入{filename}')