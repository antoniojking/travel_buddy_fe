class UserService < BaseService
  class << self
    def get_user_info(user_id)
      response = conn.get("/api/v1/users/#{user_id}")

      JSON.parse(response.body, symbolize_names: true)
    end

    def find_or_create_user(spotify_id, email, token, refresh_token)
      response = conn.post("/api/v1/users") do |req|
        req.headers['CONTENT_TYPE'] = 'application/json'
        req.params['spotify_id'] = spotify_id
        req.params['email'] = email
        req.params['token'] = token
        req.params['refresh_token'] = refresh_token
      end

      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
