class UserService
  class << self
    def conn(url)
      Faraday.new(url)
    end

    def get_user_info(spotify_id, email, token, refresh_token)
      response = conn('https://travel-buddy-api.herokuapp.com/api/v1/users').post do |f|
        f.params['spotify_id'] = spotify_id
        f.params['email'] = email
        f.params['token'] = token
        f.params['refresh_token'] = refresh_token
      end
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
