class TripFacade
  class << self
    def trip_details(trip_id)
      json = TripService.get_trip_details(trip_id)
      Trip.new(json[:data])
    end

    def new_trip(park_code, park_name, user_id)
      json = TripService.new_trip(park_code, park_name, user_id)
      Trip.new(json[:data])
    end

    def update_trip(trip_id, update_info)
      json = TripService.patch_trip(trip_id, update_info)
    end
  end
end
