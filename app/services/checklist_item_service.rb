class ChecklistItemService
  class << self
    def new_item(trip_id, checklist_id, item_name, user_id)
      response = conn.post(
         "/api/v1/trips/#{trip_id}/checklists/#{checklist_id}/checklist_items"
      ) do |req|
        req.params['name'] = item_name
        req.params['user_id'] = user_id
      end
    end
    
    def edit_item(trip_id, checklist_id, item_id, item_name)
      item_params = { item_id: item_id, name: item_name }

      response = conn.patch(
        "/api/v1/trips/#{trip_id}/checklists/#{checklist_id}/checklist_items/#{item_id}"
      ) do |req|
        req.body = item_params
      end
    end

    def delete_item(trip_id, checklist_id, item_id)
      response = conn.delete(
        "/api/v1/trips/#{trip_id}/checklists/#{checklist_id}/checklist_items/#{item_id}"
      ) do |req|
        req.body = item_id
      end
    end
  end

  def self.conn
    Faraday.new(url: 'https://travel-buddy-api.herokuapp.com')
  end
end