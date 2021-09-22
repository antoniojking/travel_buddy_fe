class TripService
  class << self
    def get_trip_details(trip_id)
      response = conn.get("/api/v1/trips/#{trip_id}")
      JSON.parse(response.body, symbolize_names: true)
    end

    def patch_trip(trip_id, update_info)
      conn.patch("/api/v1/trips/#{trip_id}") do |req|
        req.params['start_date'] = update_info[:start_date] unless update_info[:start_date].empty?
        req.params['end_date'] = update_info[:end_date] unless update_info[:end_date].empty?
      end
    end
  end

  def self.conn
    Faraday.new(url: 'https://travel-buddy-api.herokuapp.com') do |req|
    end
  end
end
