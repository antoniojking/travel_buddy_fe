class ChecklistService
  class << self
    def by_trip(trip_id)
      response = conn.get("/api/v1/trips/#{trip_id}/checklists")
      JSON.parse(response.body, symbolize_names: true)
    end

    def trip_checklist_new(trip_id, category)
      new_checklist = { category: category, trip_id: trip_id }

      response = conn.post("/api/v1/trips/#{trip_id}/checklists") do |req|
        req.body = new_checklist.to_json
      end
    end

    def single_checklist(trip_id, checklist_id)
      response = conn.get("/api/v1/trips/#{trip_id}/checklists/#{checklist_id}")

      JSON.parse(response.body, symbolize_names: true)
    end
  end

  def self.conn
    Faraday.new(url: 'https://travel-buddy-api.herokuapp.com')
  end
end
