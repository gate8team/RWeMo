class HTTPInstanceConverter
  def self.parse_current_weather web_data, weather
    web_data = JSON.parse web_data

    weather.sunrise = web_data['sys']['sunrise']
    weather.sunset = web_data['sys']['sunset']
    weather.pressure = web_data['main']['pressure']
    weather.humidity = web_data['main']['humidity']
    weather.temperature = {
        temp_min: web_data['main']['temp_min'],
        temp: web_data['main']['temp'],
        temp_max: web_data['main']['temp_max']
    }
  end

  def self.parse_current_money web_data, money
    web_data = JSON.parse web_data

    money.rate = web_data['rate']
  end
end