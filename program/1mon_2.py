import pandas as pd
import re
from datetime import datetime

def convert_chinese_date(chinese_date):
    match = re.findall(r'(\d+)年 (\d+)月', chinese_date)
    if match:
        chinese_year, chinese_month = match[0]
        ad_year = int(chinese_year) + 1911
        return f"{ad_year}-{int(chinese_month):02d}-01"
    return None

url_list_file = "/home/bimap/esg/data/datalist/1mon_2.txt"
output_filepath = "/home/bimap/esg/data/1mon_2/"
data_urls = {}
with open(url_list_file, "r") as file:
    for line in file:
        data_id, data_url = line.strip().split(",")
        data_urls[int(data_id)] = data_url

for data_id, data_url in data_urls.items():
    df = pd.read_csv(data_url)
    df = df[df["item1"].str.contains(r'\d+年 \d+月', na=False)]
    df["item1"] = df["item1"].apply(convert_chinese_date)
    df = df.dropna(subset=["item1"])
    
    output_filename = f"{output_filepath}{data_id}.csv"
    df.to_csv(output_filename, index=False)
    
    current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(f"ID {data_id} saved as {output_filename} at {current_time}.")

