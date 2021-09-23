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

    def patch_trip(trip_id, update_info)
      response = conn.patch("/api/v1/trips/#{trip_id}") do |req|
        req.params['name'] = update_info[:name] unless validate_patch(update_info[:name])
        req.params['start_date'] = update_info[:start_date] unless validate_patch(update_info[:start_date])
        req.params['end_date'] = update_info[:end_date] unless validate_patch(update_info[:end_date])
      end
    end
  end

  def self.conn
    Faraday.new(url: 'https://travel-buddy-api.herokuapp.com') do |req|
    end
  end

  private

  def self.validate_patch(key)
    key.nil? || key.empty?
  end
end
