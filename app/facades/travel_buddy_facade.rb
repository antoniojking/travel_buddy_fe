class TravelBuddyFacade
  class << self
    def travel_buddy_new(trip_id, friend_id)
      TravelBuddyService.create_new_travel_buddy(trip_id, friend_id)
    end
  end
end
