class TripService
  class << self
    def get_trip_details(trip_id)
      response = conn.get("/api/v1/trips/#{trip_id}")
      JSON.parse(response.body, symbolize_names: true)
    end
  end

  def self.conn
    Faraday.new(url: 'https://travel-buddy-api.herokuapp.com') do |req|
    end
  end
end
