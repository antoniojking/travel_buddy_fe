class UserFacade
  class << self
    def create_user(spotify_id, email, token, refresh_token)
      json = UserService.find_or_create_user(spotify_id, email, token, refresh_token)
      User.new(json)
    end
  end
end
