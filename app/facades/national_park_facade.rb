class NationalParkFacade
  class << self
    # def all_parks
    #   json = NationalParkService.all_parks
    #
    #   json[:data].map do |park_data|
    #     Park.new(park_data)
    #   end
    # end

    def parks_by_state(state_code)
      json = NationalParkService.parks_by_state(state_code)

      json[:data].map do |park|
        Park.new(park)
      end
    end

    def parks_by_activity(activity)
      json = NationalParkService.parks_by_activity(activity)

      if json == {:message=>"no park has this activity", :status=>"bad request"}
        []
      else
        json[:data].map { |park| ParkByActivity.new(park) }
      end
    end

    def park_by_code(park_code)
      json = NationalParkService.park_by_code(park_code)

      Park.new(json[:data][0])
    end
  end
end
