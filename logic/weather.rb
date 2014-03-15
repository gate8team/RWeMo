class Weather
  attr_accessor :city, :sunrise, :sunset, :pressure, :temperature, :humidity

  def initialize city
    @city = city
  end

  def kelvinToCelsius kelvin
    kelvin - 273.15
  end
end