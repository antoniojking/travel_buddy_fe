class WeatherService
  class << self
    def get_weather(lat, lon)
      response = conn.get("weather?lat=#{lat}&lon=#{lon}")

      JSON.parse(response.body, symbolize_names: true)
    end
  end


  def self.conn
    Faraday.new(url: 'https://travel-buddy-api.herokuapp.com/api/v1/') 
  end
end
