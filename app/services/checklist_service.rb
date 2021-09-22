class ChecklistService
  class << self
    # def by_trip(trip_id)
    #   response = conn.get("/api/v1/trips/#{trip_id}/checklists")
    #   JSON.parse(response.body, symbolize_names: true)
    # end

    def trip_checklist_new(trip_id, category)
      response = conn.post("/api/v1/trips/#{trip_id}/checklists") do |req|
        req.params['category'] = category
        req.params['trip_id'] = trip_id
      end
    end
  end

  def self.conn
    Faraday.new(url: 'https://travel-buddy-api.herokuapp.com') do |req|
    end
  end
end
