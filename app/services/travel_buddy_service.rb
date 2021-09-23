class TravelBuddyService
  class << self
    def create_new_travel_buddy(trip_id, friend_id)
      response = conn.post("/api/v1/trips/#{trip_id}/travel_buddies") do |req|
        req.params['user_id'] = friend_id
        req.params['trip_id'] = trip_id
      end
    end
  end

  def self.conn
    Faraday.new(url: 'https://travel-buddy-api.herokuapp.com')
  end
end
