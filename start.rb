require 'awesome_print'
require 'net/http'
require 'json'

require './core/http_helper.rb'
require './logic/city.rb'
require './logic/weather.rb'
require './core/http_instance_converter.rb'

begin
  uri = 'http://api.openweathermap.org/data/2.5/weather'

  weather = Weather.new(City.new(city_name: 'Samara', country_code: 'RU'))
  web_data = HTTPHelper.make_get_request(uri, q: (weather.city.city_name + ',' + weather.city.country_code))

  HTTPInstanceConverter.retrieve_current_weather web_data, weather

  p weather.temperature
rescue => e
  p e.message
end