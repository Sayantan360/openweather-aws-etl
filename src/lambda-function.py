import os
import json
import boto3
import requests
import tempfile
from datetime import datetime
import pandas as pd
# import bs4

# os.chdir("/tmp/")

api_key = "62bffe5d6487bba52fe4278c361c88c2"
city_name = "Seattle,US"

def fetch_weather_data_from_api(api_key,city_name):
    
    api_url = f"http://api.openweathermap.org/data/2.5/forecast?q={city_name}&appid={api_key}"
    response = requests.get(api_url)
    
    if response.status_code == 200:
        return response.json()
    else:
        raise Exception(f"Failed to fetch data from API. Status code: {response.status_code}")
    
    # print(response.content)
    # print(response.status_code)
    # print(response)
    
    
def convert_to_csv(data, csv_file_path):
    # df = pd.DataFrame(data)
    df= pd.json_normalize(data['list'])
    df.to_csv(csv_file_path, index=False)
    return csv_file_path
    
# def to_csv(raw_df):
#     # df = pd.DataFrame(raw_df)
#     csv_data = raw_df.to_csv("current_weather_data_portland.csv",encoding='utf-8',index = False)
#     return csv_data
    
def upload_to_s3(csv_file_path, bucket_name, s3_key):
    s3 = boto3.client('s3')
    with open(csv_file_path, 'rb') as f:
        s3.upload_fileobj(f, bucket_name, s3_key)
    os.remove(csv_file_path)  # Optionally remove the local CSV file after upload
    return f"Uploaded {csv_file_path} to S3 bucket: {bucket_name} with key: {s3_key}"
    
    
def lambda_handler(event, context):

    csv_file_path = os.path.join(tempfile.gettempdir(), 'openweather_data.csv')
    bucket_name = 'testweatherbucket'
    s3_key = 'openweather_data.csv'
    
    data = fetch_weather_data_from_api(api_key,city_name)
    
    csv_data = convert_to_csv(data,csv_file_path)
    
    result = upload_to_s3(csv_file_path, bucket_name, s3_key)
    
    return {
        'statusCode': 200,
        'body': result
    }
    
