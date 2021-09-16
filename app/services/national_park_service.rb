class NationalParkService
  class << self
    def all_parks
      response = conn.get('/v1/parks?limit=465')

      body = JSON.parse(response.body, symbolize_names: true)
    end

    def parks_by_state(state_code)
      response = conn.get("api/v1/parks?statecode=#{state_code}")

      body = JSON.parse(response.body, symbolize_names: true)
    end

    def park_activities
      response = conn.get('/v1/activities/parks?')

      body = JSON.parse(response.body, symbolize_names: true)
    end
  end
  

  def self.conn
    Faraday.new(url: 'https://developer.nps.gov/api') do |req|
      req.headers['X-Api-Key'] = ENV['nps_api_key']
    end
  end
end
