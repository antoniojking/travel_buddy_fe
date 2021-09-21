class WeatherService
  class << self
    def get_weather(location, days)
      response = conn.get("weather?location=#{location}&days=#{days}")

      JSON.parse(response.body, symbolize_names: true)
    end
  end


  def self.conn
    Faraday.new(url: 'https://travel-buddy-api.herokuapp.com/api/v1/') 
  end
end
