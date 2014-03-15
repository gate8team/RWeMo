require 'awesome_print'
require 'net/http'
require 'json'

require './core/http_helper.rb'
require './logic/city.rb'
require './logic/weather.rb'
require './logic/money.rb'
require './core/http_instance_converter.rb'

begin
  weather_url = 'http://api.openweathermap.org/data/2.5/weather'
  money_url = 'http://rate-exchange.appspot.com/currency'

  weather = Weather.new(City.new(city_name: 'Samara', country_code: 'RU'))
  money = Money.new(from_money_code: 'USD', to_money_code: 'RUB')

  weather_web_data = HTTPHelper.make_get_request(weather_url, q: (weather.city.city_name + ',' + weather.city.country_code))
  money_web_data = HTTPHelper.make_get_request(money_url, from: money.from_money_code, to: money.to_money_code)

  HTTPInstanceConverter.parse_current_weather weather_web_data, weather
  HTTPInstanceConverter.parse_current_money money_web_data, money

  p weather
  p money
rescue => e
  p e.message
end