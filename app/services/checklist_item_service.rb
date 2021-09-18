class ChecklistItemService
  class << self
    def trip_checklist_items(trip_id, checklist_id)
      response = conn.get("/v1/trips/#{trip_id}/checklists/#{checklist_id}")

      body = JSON.parse(response.body, symbolize_names: true)
    end
  end

  def self.conn
    Faraday.new(url: 'https://travel-buddy-api.herokuapp.com/api')
  end
end
