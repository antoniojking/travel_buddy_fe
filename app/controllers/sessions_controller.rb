class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    spotify_id = auth_hash['uid']
    email = auth_hash['info']['email']
    token = auth_hash['credentials']['token']
    refresh_token = auth_hash['credentials']['refresh_token']
    user = UserFacade.create_user(spotify_id, email, token, refresh_token)

    session[:user_id] = user.id

    redirect_to '/user_dashboard'
  end
end


# def create
#   user = User.find_by(email: params[:email])
#   if user && user.authenticate(params[:password])
#     session[:user_id] = user.id
#     flash[:success] = "Welcome, #{user.email}!"
#     redirect_to dashboard_path
#   else
#     flash[:danger] = 'Something went horribly wrong!'
#     redirect_to root_path
#   end
# end
