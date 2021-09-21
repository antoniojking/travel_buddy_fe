class UserFacade
  class << self
    def current_user_info(user_id)
      json = UserService.get_user_info(user_id)

      CurrentUser.new(json[:data])
    end

    def create_user(spotify_id, email, token, refresh_token)
      json = UserService.find_or_create_user(spotify_id, email, token, refresh_token)
      User.new(json)
    end
  end
end
