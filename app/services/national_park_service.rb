class NationalParkService
  class << self
    # def all_parks
    #   response = conn.get('parks') do |req|
    #     req.params['limit'] = 465
    #   end
    #
    #   JSON.parse(response.body, symbolize_names: true)
    # end

    def parks_by_state(state_code)
      response = conn.get('parks') do |req|
        req.params[:state] = state_code
      end

      body = JSON.parse(response.body, symbolize_names: true)
    end

    def parks_by_activity(activity)
      response = conn.get('parks') do |req|
        req.params[:activity] = activity
      end

      body = JSON.parse(response.body, symbolize_names: true)
    end

    def park_by_code(park_code)
      response = conn.get("parks/#{park_code}")

      body = JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: 'https://travel-buddy-api.herokuapp.com/api/v1/')
    end
  end
end
