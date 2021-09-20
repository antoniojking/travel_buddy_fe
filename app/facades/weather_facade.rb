class WeatherFacade
  class << self
    def get_forecast(location, days)
      json = WeatherService.get_weather(location, days)

      json[:data][:attributes][:forecast].map do |day|
        Weather.new(day))
      end
    end
  end
end