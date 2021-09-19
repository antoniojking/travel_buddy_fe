class UserService
  # class << self
  #   def conn(url)
  #     Faraday.new(url)
  #   end
  #
  #   def get_user_info(spotify_id, email, token, refresh_token)
  #     response = conn('https://travel-buddy-api.herokuapp.com/api/v1/users').post do |f|
  #       f.headers['CONTENT_TYPE'] = 'application/json'
  #       f.params['user']['spotify_id'] = spotify_id
  #       f.params['user']['email'] = email
  #       f.params['user']['token'] = token
  #       f.params['user']['refresh_token'] = refresh_token
  #     end
  #     JSON.parse(response.body, symbolize_names: true)
  #   end
  # end
  class << self
    def get_user_info(spotify_id, email, token, refresh_token)
      response = conn.post("/api/v1/users") do |req|
        req.headers['CONTENT_TYPE'] = 'application/json'
        req.params['user']['spotify_id'] = spotify_id
        req.params['user']['email'] = email
        req.params['user']['token'] = token
        req.params['user']['refresh_token'] = refresh_token
      end

      JSON.parse(response.body, symbolize_names: true)
    end
  end

  def self.conn
    Faraday.new(url: "https://travel-buddy-api.herokuapp.com")
  end
end
