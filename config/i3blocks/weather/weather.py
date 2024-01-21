import requests

def get_weather(lat, lon, api_key):
    # OpenWeatherMap endpoint with latitude, longitude, and API key
    url = f"https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={api_key}&units=imperial"

    # Send a request to the OpenWeatherMap API
    response = requests.get(url)

    # Check if the request was successful
    if response.status_code == 200:
        data = response.json()
        
        # Extract temperature and weather condition
        temperature = data['main']['temp']
        condition = data['weather'][0]['description']

        return f"{temperature}f {condition.title()}"
    else:
        return "Failed to retrieve weather data"

# Replace with your latitude, longitude, and API key
latitude = '41.363621'  # Example latitude
longitude = '-72.102943'  # Example longitude
api_key = '7f2067255cf7d2d25cce58ecdefea92e'

weather_info = get_weather(latitude, longitude, api_key)
print(weather_info)
