class TripFacade
  class << self
    def trip_details(trip_id)
      json = TripService.get_trip_details(trip_id)
      Trip.new(json[:data])
    end

    def update_trip(trip_id, update_info)
      # start_date = params[:start_date]
      # end_date = params[:end_date]
      TripService.patch_trip(trip_id, update_info)
    end
  end
end
