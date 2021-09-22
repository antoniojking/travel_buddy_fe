class ChecklistFacade
  class << self
    # def by_trip(trip_id)
    #   json = ChecklistService.by_trip(trip_id)
    #   json[:data].map do |checklist|
    #     Checklist.new(checklist)
    #   end
    # end

    def trip_checklist_new(trip_id, category)
      ChecklistService.trip_checklist_new(trip_id, category)
    end

    def grab_checklist(trip_id, checklist_id)
      json = ChecklistService.single_checklist(trip_id, checklist_id)[:data]
      Checklist.new(json)
    end
  end
end
