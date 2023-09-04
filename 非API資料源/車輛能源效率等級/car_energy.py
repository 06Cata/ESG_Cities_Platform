import requests
from bs4 import BeautifulSoup
import csv

url = "https://auto.itri.org.tw/energy_efficiency_mark.aspx"
response = requests.get(url)

if response.status_code == 200:
    # 使用BeautifulSoup解析HTML
    soup = BeautifulSoup(response.content, 'html.parser')

    # 找到表格元素
    tables = soup.find_all('div',class_='font-size2')
    names = soup.find_all('li',class_='font-size1 lineheight16em')

    for n in names:
        name = n.text.strip()
        start_index = name.find('、')+1
        stop_index = name.find('能源效率')
        csv_name = name[start_index:stop_index]
        
        # run每個表格
        for table in tables:
            with open(f'car_energy_{csv_name}.csv', 'w', newline='', encoding='utf-8-sig') as csvfile:
                writer = csv.writer(csvfile)
                

                # 提取表格標題
                title_columns = table.find_all('tr', class_='Title')
                # titles = [row.text.strip() for row in title_rows]
                title = []
                for row in title_columns:
                    tit = row.text.strip().split('\n')
                    for t in tit:
                        title.append(t)
                title.remove('等級區分')
                title.remove('(單位：公里/公升)')

                print(title)
                writer.writerow(title)

                # 提取表格内容
                data_rows = table.find_all('tr')
                datas = []
                for row in data_rows:
                    # print(row)
                    cells = row.find_all('td')
                    # print(cells)
                    # row_data = [cell.text.strip() for cell in cells]
                    data = []
                    for cell in cells:
                        row_data = cell.text.strip()
                        data.append(row_data)
                    if not data:  # 检查data是否为空列表
                        continue 
                    datas.append(data)
                    print(data)
                    writer.writerow(data)
            
            print(f'已寫入car_energy_{csv_name}.csv')

else:
    print('請求失敗')