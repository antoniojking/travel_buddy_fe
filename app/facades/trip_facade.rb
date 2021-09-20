class TripFacade
  class << self
    def trip_details(trip_id)
      json = TripService.get_trip_details(trip_id)
      Trip.new(json[:data])
      end
    end
  end
