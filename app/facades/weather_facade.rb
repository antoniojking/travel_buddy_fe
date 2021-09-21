class WeatherFacade
  class << self
    def get_forecast(location, days)
      json = WeatherService.get_weather(location, days)

      json[:data][:attributes][:forecast].map do |day|
        WeatherForecast.new(day)
      end
    end

    def get_current_weather(location, days)
      json = WeatherService.get_weather(location, days)

      CurrentWeather.new(json[:data][:attributes])
    end 
  end
end