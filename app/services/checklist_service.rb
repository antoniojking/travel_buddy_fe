class ChecklistService
  class << self
    def by_trip(trip_id)
      response = conn.get("/api/v1/trips/#{trip_id}/checklists")
      JSON.parse(response.body, symbolize_names: true)
    end

    def trip_checklist_new(trip_id, name)
      new_checklist = { name: name, trip_id: trip_id }

      response = conn.post("/api/v1/trips/#{trip_id}/checklists") do |req|
        req.body = new_checklist.to_json
      end

      JSON.parse(response.body, symbolize_names: true)
    end
  end

  def self.conn
    Faraday.new(url: 'https://travel-buddy-api.herokuapp.com') do |req|
    end
  end
end
