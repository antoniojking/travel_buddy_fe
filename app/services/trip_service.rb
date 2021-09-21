class TripService
  class << self
    def get_trip_details(trip_id)
      response = conn.get("/api/v1/trips/#{trip_id}")
      JSON.parse(response.body, symbolize_names: true)
    end

    def new_trip(park_code, park_name, user_id)
      response = conn.post("/api/v1/trips?") do |req|
        req.params['user_id']   = user_id
        req.params['park_code'] = park_code
        req.params['park_name'] = park_name

      end
      JSON.parse(response.body, symbolize_names: true)
    end
  end

  def self.conn
    Faraday.new(url: 'https://travel-buddy-api.herokuapp.com') do |req|
    end
  end
end
