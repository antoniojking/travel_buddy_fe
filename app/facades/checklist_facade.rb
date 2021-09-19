class ChecklistFacade
  class << self
    def by_trip(trip_id)
      json = ChecklistService.by_trip(trip_id)
      json[:data].map do |checklist|
        Checklist.new(checklist)
      end
    end

    def trip_checklist_new(trip_id, new_checklist)
      json = ChecklistService.trip_checklist_new(trip_id, new_checklist)
      json[:data].map do |checklist|
        Checklist.new(checklist)
      end
    end
  end
end
