import json
import requests
from datetime import datetime
import pandas as pd
# import bs4

api_key = "62bffe5d6487bba52fe4278c361c88c2"
city_name = "Seattle,US"

def kelvin_to_fahrenheit(temp_in_kelvin):
    temp_in_fahrenheit = (temp_in_kelvin - 273.15) * (9/5) + 32
    return temp_in_fahrenheit

def get_weather(api_key,city_name):
    url = f"http://api.openweathermap.org/data/2.5/forecast?q={city_name}&appid={api_key}"
    
    data = requests.get(url).json()
    # print(resp.content)
    # print(resp.status_code)
    # print(resp)
    
    
    city = data["name"]
    weather_description = data["weather"][0]['description']
    temp_farenheit = kelvin_to_fahrenheit(data["main"]["temp"])
    feels_like_farenheit= kelvin_to_fahrenheit(data["main"]["feels_like"])
    min_temp_farenheit = kelvin_to_fahrenheit(data["main"]["temp_min"])
    max_temp_farenheit = kelvin_to_fahrenheit(data["main"]["temp_max"])
    pressure = data["main"]["pressure"]
    humidity = data["main"]["humidity"]
    wind_speed = data["wind"]["speed"]
    time_of_record = datetime.utcfromtimestamp(data['dt'] + data['timezone'])
    sunrise_time = datetime.utcfromtimestamp(data['sys']['sunrise'] + data['timezone'])
    sunset_time = datetime.utcfromtimestamp(data['sys']['sunset'] + data['timezone'])

    transformed_data = {"City": city,
                        "Description": weather_description,
                        "Temperature (F)": temp_farenheit,
                        "Feels Like (F)": feels_like_farenheit,
                        "Minimun Temp (F)":min_temp_farenheit,
                        "Maximum Temp (F)": max_temp_farenheit,
                        "Pressure": pressure,
                        "Humidty": humidity,
                        "Wind Speed": wind_speed,
                        "Time of Record": time_of_record,
                        "Sunrise (Local Time)":sunrise_time,
                        "Sunset (Local Time)": sunset_time                        
                        }
                        
    return transformed_data
    
    
def to_csv(dict_data):
    df = pd.DataFrame(dict_data)
    csv_data = df.to_csv("current_weather_data_portland.csv", index = False)
    return csv_data
    
def lambda_handler(event, context):
    # TODO implement
    raw_data = get_weather(api_key,city_name)
    to_csv = csv(raw_data)
    
    
    
