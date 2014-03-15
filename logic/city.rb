class City
  attr_accessor :city_name, :country_code

  def initialize params
    @city_name = params[:city_name]
    @country_code = params[:country_code]
  end
end