class WeatherFacade
  class << self
    def get_current_weather(lat, lon)
      json = WeatherService.get_weather(lat, lon)

      CurrentWeather.new(json[:data])
    end 
  end
end