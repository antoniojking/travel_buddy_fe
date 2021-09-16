class NationalParkService
  def self.all_parks
    response = conn.get('/v1/parks?limit=465')

    body = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://developer.nps.gov/api') do |req|
      req.headers['X-Api-Key'] = ENV['nps_api_key']
    end
  end
end
