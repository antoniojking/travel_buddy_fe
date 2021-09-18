class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    spotify_id = auth_hash['uid']
    email = auth_hash['info']['email']
    token = auth_hash['credentials']['token']
    refresh_token = auth_hash['credentials']['refresh_token']

    user = UserService.get_user_info(spotify_id, email, token, refresh_token)
    # call Facade (service -> poro -> facade)

    session[:user_id] = user.id

    redirect_to '/user_dashboard'
  end
end
